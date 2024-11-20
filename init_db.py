import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # 先尝试不指定数据库连接
        conn = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='Muji2287300!'
        )

        if conn.is_connected():
            cursor = conn.cursor()

            # 检查数据库是否已存在
            cursor.execute("SHOW DATABASES LIKE 'fashion_bi'")
            result = cursor.fetchone()
            
            if result:
                print("Database 'fashion_bi' already exists.")
                return
            
            # 创建数据库和表
            print("Creating database...")
            cursor.execute("CREATE DATABASE fashion_bi")
            cursor.execute("USE fashion_bi")

            # 创建用户表
            cursor.execute('''
                CREATE TABLE users (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(50) UNIQUE NOT NULL,
                    password VARCHAR(100) NOT NULL
                )
            ''')

            # 创建服装类别表
            cursor.execute('''
                CREATE TABLE clothing_categories (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    category_name VARCHAR(50) UNIQUE NOT NULL,
                    base_price DECIMAL(10,2) NOT NULL,
                    production_quantity INT NOT NULL DEFAULT 1000
                )
            ''')

            # 创建销售数据表
            cursor.execute('''
                CREATE TABLE sales_data (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    date DATE NOT NULL,
                    category_id INT NOT NULL,
                    quantity INT NOT NULL,
                    unit_price DECIMAL(10,2) NOT NULL,
                    country VARCHAR(50) NOT NULL,
                    FOREIGN KEY (category_id) REFERENCES clothing_categories(id)
                )
            ''')

            # 插入初始服装类别数据
            cursor.execute('''
                INSERT INTO clothing_categories 
                (category_name, base_price, production_quantity) VALUES 
                ('Socks', 9.99, 1000),
                ('Hats', 19.99, 1000),
                ('Coats', 89.99, 1000),
                ('T-Shirts', 29.99, 1000),
                ('Pants', 59.99, 1000)
            ''')

            conn.commit()
            print("Database and tables created successfully!")

    except Error as e:
        print(f"Error: {e}")
        return False

    finally:
        if conn and conn.is_connected():
            cursor.close()
            conn.close()
            print("Database connection closed.")

    return True

if __name__ == "__main__":
    create_database() 