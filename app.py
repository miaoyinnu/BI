from flask import Flask, render_template, request, redirect, url_for
from database import get_db_connection  # 导入数据库连接函数

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None  # 用于存储错误信息
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        if username and password:
            conn = get_db_connection()
            cursor = conn.cursor()

            # 查询数据库，检查用户名和密码是否匹配
            query = "SELECT * FROM users WHERE username = %s AND password = %s"
            cursor.execute(query, (username, password))
            user = cursor.fetchone()

            cursor.close()
            conn.close()

            if user:
                # 登录成功，跳转到仪表板
                return redirect(url_for('dashboard', username=username))
            else:
                error = "用户名或密码错误"
        else:
            error = "请输入用户名和密码"

    return render_template('login.html', error=error)

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/dashboard')
def dashboard():
    username = request.args.get('username', 'Guest')  # 获取传递的用户名，默认为Guest
    return render_template('dashboard.html', username=username)

if __name__ == '__main__':
    app.run(debug=True, port=5000)