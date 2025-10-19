#!/usr/bin/env python3
# MySQLServer.py
# Creates the alx_book_store database (does not fail if it already exists).

import os
import sys
import getpass
import mysql.connector
from mysql.connector import errorcode, Error


DB_NAME = "alx_book_store"

def create_database(cursor):
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS {DB_NAME};")

def connect_with_credentials(user="root", password=None, host="127.0.0.1", port=3306):
    conn_kwargs = {"user": user, "host": host, "port": port}
    # Only include password if it's not None (mysql.connector accepts empty string too,
    # but passing None avoids confusion when no password is expected).
    if password is not None:
        conn_kwargs["password"] = password
    return mysql.connector.connect(**conn_kwargs)

def main():
    # Try password from environment variable first (common CI / user setups)
    env_pwd = os.getenv("MYSQL_PWD")
    tried_interactive = False
    conn = None
    try:
        try:
            conn = connect_with_credentials(password=env_pwd)
        except Error as err:
            # If access denied and we are in a terminal, prompt once for password
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR and sys.stdin.isatty():
                tried_interactive = True
                pwd = getpass.getpass(prompt="MySQL root password (press Enter if none): ")
                try:
                    conn = connect_with_credentials(password=pwd)
                except Error as err2:
                    print(f"Error: Could not connect to MySQL server. {err2}")
                    sys.exit(1)
            else:
                print(f"Error: Could not connect to MySQL server. {err}")
                sys.exit(1)

        cursor = conn.cursor()
        create_database(cursor)
        # Commit not required for CREATE DATABASE, but safe to run
        conn.commit()
        print(f"Database '{DB_NAME}' created successfully!")
    except Error as e:
        print(f"Error: {e}")
        sys.exit(1)
    finally:
        # Clean up
        try:
            if 'cursor' in locals() and cursor:
                cursor.close()
        except Exception:
            pass
        try:
            if conn is not None and conn.is_connected():
                conn.close()
        except Exception:
            pass

if __name__ == "__main__":
    main()
