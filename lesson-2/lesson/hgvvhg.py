import sqlite3
import pyodbc  # SQL server

con_str = "DRIVER={SQL SERVER;SERVER=SANJARBEK\SQLEXPRESS;DATABASE=hometask1;Trusted_Connection=yes;"
con = pyodbc.connect(con_str)
cursor = con.cursor()

cursor.execute(
    """
    SELECT * FROM products
    """
)

row = cursor.fetchone()
print(row)
