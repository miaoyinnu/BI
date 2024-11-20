import mysql.connector
from mysql.connector import Error

def get_db_connection():
    try:
        conn = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password='Muji2287300!',
            database='fashion_bi'
        )
        return conn
    except Error as e:
        print(f"Error connecting to database: {e}")
        return None 