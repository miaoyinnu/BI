import mysql.connector
from mysql.connector import Error



def create_database():
    try:
        conn = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='Muji2287300!'
        )

        if conn.is_connected():
            cursor = conn.cursor()


            cursor.execute("SHOW DATABASES LIKE 'fashion_bi'")
            result = cursor.fetchone()

            if result:
                print("Database 'fashion_bi' already exists.")
            else:
                print("Creating database...")
                cursor.execute("CREATE DATABASE fashion_bi")
                print("Database created successfully!")

    except Error as e:
        print(f"Error: {e}")
    finally:
        if conn and conn.is_connected():
            cursor.close()
            conn.close()
            print("Database connection closed.")

def import_data_from_file(file_path):
    try:
        conn = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='Muji2287300!',
            database='fashion_bi'
        )

        if conn.is_connected():
            cursor = conn.cursor()
            print("Database connection successful. Importing data...")


            with open(file_path, 'r', encoding='utf-8') as file:
                sql_script = file.read()


            sql_commands = sql_script.split(';')
            for command in sql_commands:
                command = command.strip()
                if command:
                    cursor.execute(command)

            conn.commit()
            print("Data imported successfully from file!")

    except Error as e:
        print(f"Error: {e}")

    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()
            print("Database connection closed.")

def create_tables():
    try:
        conn = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='Muji2287300!',
            database='fashion_bi'
        )

        if conn.is_connected():
            cursor = conn.cursor()

            print("Creating tables...")


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS users (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    username VARCHAR(50) UNIQUE NOT NULL,
                    password VARCHAR(100) NOT NULL
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS clothing_categories (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    category_name VARCHAR(50) UNIQUE NOT NULL,
                    base_price DECIMAL(10,2) NOT NULL,
                    production_quantity INT NOT NULL DEFAULT 1000
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS DateDim (
                    DateID INT AUTO_INCREMENT PRIMARY KEY,
                    Year INT DEFAULT NULL,
                    Quarter VARCHAR(2) DEFAULT NULL,
                    Month VARCHAR(20) DEFAULT NULL
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS feedback (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    rating VARCHAR(10) NOT NULL,
                    created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS HistoricalSales (
                    HistoricalID INT AUTO_INCREMENT PRIMARY KEY,
                    ProductID INT DEFAULT NULL,
                    RegionID INT DEFAULT NULL,
                    DateID INT DEFAULT NULL,
                    PY_SellingRevenue DECIMAL(10,2) DEFAULT NULL,
                    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
                    FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
                    FOREIGN KEY (DateID) REFERENCES DateDim(DateID)
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS Product (
                    ProductID INT AUTO_INCREMENT PRIMARY KEY,
                    ProductName VARCHAR(100) DEFAULT NULL,
                    Category VARCHAR(100) DEFAULT NULL,
                    Price DECIMAL(10,2) DEFAULT NULL
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS Region (
                    RegionID INT AUTO_INCREMENT PRIMARY KEY,
                    Country VARCHAR(100) DEFAULT NULL,
                    RegionName VARCHAR(100) DEFAULT NULL
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS Sales (
                    SalesID INT AUTO_INCREMENT PRIMARY KEY,
                    ProductID INT DEFAULT NULL,
                    RegionID INT DEFAULT NULL,
                    DateID INT DEFAULT NULL,
                    SellingRevenue DECIMAL(10,2) DEFAULT NULL,
                    SellingNumber INT DEFAULT NULL,
                    GrossMargin DECIMAL(10,2) DEFAULT NULL,
                    GrossProfitRate DECIMAL(5,2) DEFAULT NULL,
                    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
                    FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
                    FOREIGN KEY (DateID) REFERENCES DateDim(DateID)
                )
            ''')


            cursor.execute('''
                CREATE TABLE IF NOT EXISTS sales_data (
                    id INT AUTO_INCREMENT PRIMARY KEY,
                    date DATE NOT NULL,
                    category_id INT NOT NULL,
                    quantity INT NOT NULL,
                    unit_price DECIMAL(10,2) NOT NULL,
                    country VARCHAR(50) NOT NULL,
                    FOREIGN KEY (category_id) REFERENCES clothing_categories(id)
                )
            ''')

            conn.commit()
            print("All tables created successfully!")

    except Error as e:
        print(f"Error: {e}")
    finally:
        if conn and conn.is_connected():
            cursor.close()
            conn.close()
            print("Database connection closed.")
if __name__ == "__main__":

    create_database()
    create_tables()