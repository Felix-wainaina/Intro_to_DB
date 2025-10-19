#!/usr/bin/env python3
# MySQLServer.py
# Creates the alx_book_store database (does not fail if it already exists)

import mysql.connector

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host="localhost",
        user="root",
        password="your_mysql_password_here"  # replace with your password
    )

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    if 'cursor' in locals():
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
