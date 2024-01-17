import mysql.connector


def connect_mysql():
    try:
        db = mysql.connector.connect(
            host="localhost",
            user="root",
            database="dini_atlas",
            # password="yourpassword"
        )

        cursor = db.cursor(dictionary=True)
        return db, cursor

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None, None
