import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    unix_socket="/var/run/mysqld/mysqld.sock"  # ✅ use unix socket auth
)

cursor = conn.cursor()
cursor.execute("CREATE DATABASE IF NOT EXISTS mydb;")
print("Database created or already exists.")

conn.close()
