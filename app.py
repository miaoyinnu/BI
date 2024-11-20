from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        if username and password:  # 只要输入了用户名和密码就允许登录
            return redirect(url_for('dashboard', username=username))  # 传递用户名到dashboard
        return render_template('login.html')
    
    return render_template('login.html')

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/dashboard')
def dashboard():
    username = request.args.get('username', 'Guest')  # 获取传递的用户名，默认为Guest
    return render_template('dashboard.html', username=username)

if __name__ == '__main__':
    app.run(debug=True, port=5000)