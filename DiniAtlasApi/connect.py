from flask import current_app, g
import mysql.connector


def get_db():
    if "db" not in g:
        password = current_app.config.get("DB_PASSWORD")
        g.db = mysql.connector.connect(
            host=current_app.config["DB_HOST"],
            user=current_app.config["DB_USER"],
            password=password if password else None,
            database=current_app.config["DB_DATABASE"],
        )
    return g.db


def get_cursor():
    db = get_db()
    return db.cursor(dictionary=True, buffered=True)


def close_db(e=None):
    db = g.pop("db", None)

    if db is not None:
        db.close()


def init_app(app):
    app.teardown_appcontext(close_db)
