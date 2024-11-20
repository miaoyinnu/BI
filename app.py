from flask import Flask, render_template, request, redirect, url_for, session, jsonify
import mysql.connector
from database import get_db_connection
import re
import pandas as pd
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # 用于session加密

# 数据库配置
db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'Muji2287300!',
    'database': 'fashion_bi'
}

UPLOAD_FOLDER = 'uploads'
ALLOWED_EXTENSIONS = {'csv'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# 确保上传目录存在
os.makedirs(UPLOAD_FOLDER, exist_ok=True)


@app.route('/')
def index():
    # 移除 session 检查，总是显示首页
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        # 验证成功后
        if verify_user(username, password):
            session['username'] = username  # 存储用户名到 session
            return redirect(url_for('dashboard'))
    return render_template('login.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        confirm_password = request.form['confirm_password']

        # 基本验证
        if len(username) < 3:
            return render_template('register.html', error='Username must be at least 3 characters long')

        if len(password) < 6:
            return render_template('register.html', error='Password must be at least 6 characters long')

        if password != confirm_password:
            return render_template('register.html', error='Passwords do not match')

        # 检查用户名是否已存在
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        try:
            cursor.execute('SELECT * FROM users WHERE username = %s', (username,))
            if cursor.fetchone():
                return render_template('register.html', error='Username already exists')

            # 创建新用户
            cursor.execute('INSERT INTO users (username, password) VALUES (%s, %s)',
                           (username, password))
            conn.commit()

            # 注册成功后自动登录
            session['username'] = username
            return redirect(url_for('dashboard'))

        except Exception as e:
            return render_template('register.html', error='Registration failed. Please try again.')
        finally:
            cursor.close()
            conn.close()

    return render_template('register.html')


@app.route('/dashboard')
def dashboard():
    if 'username' not in session:
        return redirect(url_for('login'))
    
    username = session.get('username', '')  # 获取用户名
    return render_template('dashboard.html', username=username)


@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return render_template('dashboard.html', error='No file selected')

    file = request.files['file']
    if file.filename == '':
        return render_template('dashboard.html', error='No file selected')

    if file and file.filename.endswith('.csv'):
        filename = secure_filename(file.filename)
        filepath = os.path.join(app.config['UPLOAD_FOLDER'], filename)
        file.save(filepath)

        try:
            # 读取CSV文件并存入数据库
            df = pd.read_csv(filepath)
            conn = mysql.connector.connect(**db_config)
            cursor = conn.cursor()

            for _, row in df.iterrows():
                cursor.execute('''
                    INSERT INTO sales_data (date, product, quantity, amount)
                    VALUES (%s, %s, %s, %s)
                ''', (row['date'], row['product'], row['quantity'], row['amount']))

            conn.commit()
            cursor.close()
            conn.close()

            return render_template('dashboard.html', success='Data uploaded successfully')
        except Exception as e:
            return render_template('dashboard.html', error=f'Error processing file: {str(e)}')

    return render_template('dashboard.html', error='Invalid file type')


@app.route('/chart-data')
def chart_data():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    cursor.execute('SELECT date, SUM(amount) FROM sales_data GROUP BY date ORDER BY date')
    results = cursor.fetchall()
    cursor.close()
    conn.close()

    return jsonify({
        'labels': [row[0] for row in results],
        'values': [float(row[1]) for row in results]
    })


@app.route('/sales-analysis')
def sales_analysis():
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    try:
        # 获取每种产品的销售量和价格
        cursor.execute('''
            SELECT 
                c.category_name,
                c.base_price,
                COALESCE(SUM(s.quantity), 0) as total_quantity,
                COALESCE(AVG(s.unit_price), c.base_price) as avg_price
            FROM clothing_categories c
            LEFT JOIN sales_data s ON c.id = s.category_id
            GROUP BY c.id, c.category_name, c.base_price
            ORDER BY total_quantity DESC
        ''')

        results = cursor.fetchall()
        
        categories = [row[0] for row in results]
        base_prices = [float(row[1]) for row in results]
        quantities = [int(row[2]) for row in results]
        avg_prices = [float(row[3]) for row in results]

        return jsonify({
            'categories': categories,
            'base_prices': base_prices,
            'sales_quantities': quantities,
            'avg_prices': avg_prices
        })

    except Exception as e:
        print(f"Error in sales analysis: {e}")
        return jsonify({
            'categories': [],
            'base_prices': [],
            'sales_quantities': [],
            'avg_prices': []
        })
    
    finally:
        cursor.close()
        conn.close()


@app.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('login'))


if __name__ == '__main__':
    app.run(debug=True)