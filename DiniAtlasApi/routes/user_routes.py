from flask import Blueprint, request, jsonify
from connect import get_db, get_cursor
import json

app = Blueprint("user_app", __name__)


@app.route("/kaza", methods=["GET", "POST"])
def kaza_borcu():
    db = get_db()
    cursor = get_cursor()
    if request.method == "POST":
        data = request.get_json()
        mail = data["mail"]
        kaza = data["data"]

        cursor.execute(
            "SELECT id FROM kaza_borclari WHERE mail = %s",
            (mail,),
        )
        user = cursor.fetchone()
        if user:
            # Update
            cursor.execute(
                "UPDATE kaza_borclari SET data = %s WHERE mail = %s",
                (json.dumps(kaza), mail),
            )
            db.commit()
        else:
            # Insert
            cursor.execute(
                    "INSERT INTO kaza_borclari (mail, data) VALUES (%s, %s)",
                    (mail, json.dumps(kaza)),
                )
            db.commit()
        return jsonify({"success": 1, "message": "Kaza borçlarınız güncellendi."})
    
    else:
        mail = request.args.get("mail")

        cursor.execute(
            "SELECT data FROM kaza_borclari WHERE mail = %s",
            (mail,),
        )
        kaza_borcu = cursor.fetchone()
        if kaza_borcu:
            return jsonify({"success": 1, "data": json.loads(kaza_borcu["data"])})
        else:
            return jsonify({"success": 1, "data": {}})
