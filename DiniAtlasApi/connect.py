import mysql.connector


def connect_mysql():
    try:
        db = mysql.connector.connect(
            host="localhost",
            user="root",
            database="dini_atlas",
            # password="yourpassword"
        )

        """ db = mysql.connector.connect(
            host="localhost",
            user="kodlayalim_user",
            database="kodlayalim_diniatlas",
            password="Ankara.0660.",
        )  """

        cursor = db.cursor(dictionary=True, buffered=True)
        return db, cursor

    except mysql.connector.Error as err:
        print(f"Error: {err}")
        return None, None
