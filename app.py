from flask import Flask, render_template, request, redirect, url_for
from database import get_db_connection  # 导入数据库连接函数

app = Flask(__name__)


@app.route('/feedback')
def feedback():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # 获取反馈评价的分布数据
        cursor.execute("""
            SELECT rating, 
                   ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM feedback)), 2) as percentage
            FROM feedback 
            GROUP BY rating 
            ORDER BY FIELD(rating, 'good', 'medium', 'bad')
        """)

        results = cursor.fetchall()
        # 初始化百分比为0
        percentages = {'good': 0, 'medium': 0, 'bad': 0}
        for row in results:
            percentages[row[0]] = row[1]

        return render_template('feedback.html', percentages=percentages)

    except Exception as e:
        print(f"Error: {e}")
        return render_template('feedback.html', percentages={'good': 0, 'medium': 0, 'bad': 0})
    finally:
        cursor.close()
        conn.close()
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
    username = request.args.get('username', 'Guest')  # 获取传递的用户名，默认为 Guest

    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    try:
        # 查询统计数据
        stats_query = """
        SELECT
            SUM(SellingRevenue) AS total_revenue,
            AVG(GrossProfitRate) AS avg_profit_rate,
            SUM(GrossMargin) AS total_margin,
            SUM(SellingNumber) AS total_sold
        FROM Sales
        """
        cursor.execute(stats_query)
        stats = cursor.fetchone()

        # 查询国家收入分布数据
        country_income_query = """
        SELECT
            r.Country,
            SUM(s.SellingRevenue) AS revenue
        FROM Sales s
        JOIN Region r ON s.RegionID = r.RegionID
        GROUP BY r.Country
        """
        cursor.execute(country_income_query)
        country_income = cursor.fetchall()

        # 查询销售收入与去年销售收入对比数据
        sales_vs_py_query = """
        SELECT
            d.Month,
            SUM(s.SellingRevenue) AS current_revenue,
            SUM(h.PY_SellingRevenue) AS previous_revenue
        FROM Sales s
        JOIN DateDim d ON s.DateID = d.DateID
        JOIN HistoricalSales h ON s.ProductID = h.ProductID AND s.RegionID = h.RegionID AND s.DateID = h.DateID
        GROUP BY d.Month, d.DateID
        ORDER BY d.DateID
        """
        cursor.execute(sales_vs_py_query)
        sales_vs_py = cursor.fetchall()

        # 查询年度收入分布数据
        year_income_query = """
        SELECT
            d.Month,
            SUM(s.SellingRevenue) AS revenue
        FROM Sales s
        JOIN DateDim d ON s.DateID = d.DateID
        GROUP BY d.Month, d.DateID
        ORDER BY d.DateID
        """
        cursor.execute(year_income_query)
        year_income = cursor.fetchall()

        # 查询产品收入分布数据
        product_income_query = """
        SELECT
            p.ProductName,
            SUM(s.SellingRevenue) AS revenue
        FROM Sales s
        JOIN Product p ON s.ProductID = p.ProductID
        GROUP BY p.ProductName
        """
        cursor.execute(product_income_query)
        product_income = cursor.fetchall()

        # 将数据传递给模板
        return render_template('dashboard.html', username=username, stats=stats,
                               country_income=country_income, sales_vs_py=sales_vs_py,
                               year_income=year_income, product_income=product_income)

    except Exception as e:
        print(f"Error: {e}")
        return render_template('dashboard.html', username=username)
    finally:
        cursor.close()
        conn.close()
if __name__ == '__main__':
    app.run(debug=True, port=5000)