from flask import Blueprint, request, jsonify
import helper
import connect
import json

db, cursor = connect.connect_mysql()

app = Blueprint("user_app", __name__)


@app.route("/auth", methods=["GET", "POST"])
def kullanici():
    print(request.headers)
    if request.method == "POST":
        data = request.get_json()
        mail = data["mail"]
        password = helper.md5(data["password"])

        cursor.execute(
            "SELECT id FROM kullanicilar WHERE mail = %s AND password = %s",
            (mail, password),
        )
        user = cursor.fetchone()
        if user:
            return jsonify(
                {
                    "success": 0,
                    "message": "Böyle bir hesap zaten mevcut.",
                }
            )
        else:
            cursor.execute(
                "INSERT INTO kullanicilar (mail, password) VALUES (%s, %s)",
                (mail, password),
            )
            db.commit()
            return jsonify({"success": 1, "message": "Hesap oluşturuldu."})
    else:
        mail = request.args.get("mail")
        password = helper.md5(request.args.get("password"))
        cursor.execute(
            "SELECT id FROM kullanicilar WHERE mail = %s AND password = %s",
            (mail, password),
        )
        user = cursor.fetchone()
        if not user:
            return jsonify({"success": 0, "message": "Hatalı bilgiler."})
        else:
            return jsonify({"success": 1, "message": "Giriş yapıldı."})


@app.route("/kaza", methods=["GET", "POST"])
def kaza_borcu():
    if request.method == "POST":
        data = request.get_json()
        mail = data["mail"]
        password = helper.md5(data["password"])
        kaza = data["data"]

        cursor.execute(
            "SELECT id FROM kullanicilar WHERE mail = %s AND password = %s",
            (mail, password),
        )
        user = cursor.fetchone()
        if user:
            cursor.execute(
                "SELECT id FROM kullanici_kaza_borclari WHERE id = %s", (user["id"],)
            )
            kaza_borcu = cursor.fetchone()
            if kaza_borcu:
                # Update
                cursor.execute(
                    "UPDATE kullanici_kaza_borclari SET data = %s WHERE id = %s",
                    (json.dumps(kaza), user["id"]),
                )
                db.commit()
                return jsonify(
                    {"success": 1, "message": "Kaza borçlarınız güncellendi."}
                )
            else:
                # Instert
                cursor.execute(
                    "INSERT INTO kullanici_kaza_borclari (user_id, data) VALUES (%s, %s)",
                    (user["id"], json.dumps(kaza)),
                )
                db.commit()
                return jsonify({"success": 1, "message": "Kaza borçlarınız eklendi."})
        else:
            return jsonify({"success": 0, "message": "Bir sorun oluştu."})
    else:
        mail = request.args.get("mail")
        password = helper.md5(request.args.get("password"))

        cursor.execute(
            "SELECT id FROM kullanicilar WHERE mail = %s AND password = %s",
            (mail, password),
        )
        user = cursor.fetchone()
        if user:
            cursor.execute(
                "SELECT data FROM kullanici_kaza_borclari WHERE user_id = %s",
                (user["id"],),
            )
            kaza_borcu = cursor.fetchone()
            if kaza_borcu:
                return jsonify({"success": 1, "data": json.loads(kaza_borcu["data"])})
            else:
                return jsonify({"success": 1, "data": []})
        else:
            return "Error", 401
