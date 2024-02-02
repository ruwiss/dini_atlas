from flask import Blueprint, request, jsonify, send_file
from selectolax.lexbor import LexborHTMLParser
from datetime import datetime
from markupsafe import escape
import requests
import connect
import helper
import json
import io

db, cursor = connect.connect_mysql()

app = Blueprint("content_app", __name__)


@app.route("/")
def index():
    return "OK"


@app.route("/kuran/sureler")
def sure_listesi():
    cursor.execute(
        "SELECT DISTINCT sure, isim, isim_ar, ayet_sayisi, yer, cuz, sayfa FROM sureler ORDER BY sure ASC"
    )
    liste = cursor.fetchall()
    return jsonify(liste)


@app.route("/kuran")
def kuran():
    sure = int(request.args.get("sure", 1))
    ayet = int(request.args.get("ayet", 0))
    sayfa = int(request.args.get("sayfa", 0))
    offset = int(request.args.get("offset", 0))

    if sayfa:
        cursor.execute("SELECT * FROM sureler WHERE sayfa = %s", (sayfa,))
        sure_data = cursor.fetchone()

        if not sure_data:
            return jsonify({})

        cursor.execute(
            "SELECT * FROM kuran WHERE sure = %s ORDER BY ayet ASC LIMIT 10 OFFSET %s",
            (sure_data["sure"], offset),
        )
        ayetler = cursor.fetchall()
        return jsonify({"sure": sure_data, "ayetler": ayetler})

    else:
        cursor.execute("SELECT * FROM sureler WHERE sure = %s", (sure,))
        sure_data = cursor.fetchone()

        if not ayet:
            cursor.execute(
                """SELECT * FROM kuran
      WHERE sure = %s
      ORDER BY ayet ASC
      LIMIT 10 OFFSET %s;""",
                (sure, offset),
            )
            ayetler = cursor.fetchall()
            return jsonify({"sure": sure_data, "ayetler": ayetler})
        else:
            cursor.execute(
                """SELECT *
      FROM kuran
      WHERE sure = %s AND ayet = %s;
      """,
                (sure, ayet),
            )
            ayet = cursor.fetchone()
            return jsonify({"sure": sure_data, "ayetler": ayet})


@app.route("/hadis/riyazus_salihin")
@app.route("/hadis/riyazus_salihin/<int:hadis_id>")
def hadis(hadis_id=None):
    offset = int(request.args.get("offset", 0))
    limit = 5 if not hadis_id else 1
    if hadis_id:
        cursor.execute("SELECT * FROM riyazus_salihin WHERE hadis_id = %s", (hadis_id,))
        hadis = cursor.fetchone()
        hadis["arapca"] = helper.remove_html_tags(hadis["arapca"])
        hadis["turkce"] = helper.remove_html_tags(hadis["turkce"])
        return jsonify(hadis)
    else:
        cursor.execute(
            "SELECT * FROM riyazus_salihin ORDER BY hadis_id ASC LIMIT %s OFFSET %s",
            (limit, offset),
        )
        hadisler = cursor.fetchall()
        cleaned_hadisler = [
            {
                "hadis_id": hadis["hadis_id"],
                "baslik": hadis["baslik"],
                "arapca": helper.remove_html_tags(hadis["arapca"]),
                "turkce": helper.remove_html_tags(hadis["turkce"]),
            }
            for hadis in hadisler
        ]
        return jsonify(cleaned_hadisler)


@app.route("/hadis/riyazus_salihin/ara")
def hadis_ara():
    query = request.args.get("query", None)
    offset = int(request.args.get("offset", 0))
    if not query:
        return jsonify([])
    cursor.execute(
        f"""SELECT * FROM riyazus_salihin WHERE turkce LIKE %s LIMIT 5 OFFSET %s;""",
        (f"%{query}%", offset),
    )
    hadisler = cursor.fetchall()
    cleaned_hadisler = [
        {
            "hadis_id": hadis["hadis_id"],
            "baslik": hadis["baslik"],
            "arapca": helper.remove_html_tags(hadis["arapca"]),
            "turkce": helper.remove_html_tags(hadis["turkce"]),
        }
        for hadis in hadisler
    ]
    return jsonify(cleaned_hadisler)


@app.route("/kuran/okuyucular")
def kuran_okuyuculari():
    r = requests.get("https://mp3quran.net/api/v3/ayat_timing/reads")
    reciters = r.json()

    okuyucular = []
    for i in reciters:
        server = i["folder_url"].split(".mp3quran.net")[0].split("/")[2]
        server_folder = i["folder_url"].split(".mp3quran.net/")[1].replace("/", "")
        okuyucular.append(
            {
                "id": i["id"],
                "name": i["name"],
                "sure_count": i["soar_count"],
                "reciter_url": f"/kuran/okuyucu/{server}/{server_folder}/{i['id']}",
            }
        )

    return jsonify(okuyucular)


@app.route("/kuran/okuyucu/<server>/<server_folder>/<int:id>/")
def kuran_okuyucusu(server, server_folder, id):
    folder_link = f"https://{escape(server)}.mp3quran.net/{escape(server_folder)}/"
    r = requests.get(folder_link)

    folder_tree = LexborHTMLParser(r.text)
    mp3_list = [mp3.text() for mp3 in folder_tree.css("a")]
    del mp3_list[0]

    sure_list = []

    for mp3 in mp3_list:
        try:
            sure_list.append(
                {
                    "id": str(int(mp3.split(".")[0])),
                    "url": f"/kuran/ayet_takibi/{server}/{server_folder}/{id}/{str(int(mp3.split('.')[0]))}",
                }
            )
        except:
            pass

    return jsonify(sure_list)


@app.route("/kuran/ayet_takibi/<server>/<server_folder>/<int:id>/<int:sure>")
def kuran_dinle(server, server_folder, id, sure):
    audio_link = f"https://{escape(server)}.mp3quran.net/{escape(server_folder)}/{str(sure).zfill(3)}.mp3"
    timing_link = f"https://www.mp3quran.net/api/v3/ayat_timing?surah={escape(sure)}&read={escape(id)}"

    r = requests.get(timing_link)
    data = r.json()

    return jsonify(
        {
            "audio": audio_link,
            "pages": data,
        }
    )


@app.route("/dinigunler")
def dini_gunler():
    id = (datetime.now().year - 2024) + 151
    r = requests.get(f"https://vakithesaplama.diyanet.gov.tr/icerik.php?icerik={id}")
    node = LexborHTMLParser(r.text).css_first("tbody").css("tr")
    del node[:3]

    data = []
    for i in node:
        i_css = i.css("td")
        hicri_date = f"{i_css[0].text().strip()} {i_css[1].text().strip()} {i_css[2].text().strip()}"
        date = f"{i_css[3].text().strip()} {i_css[4].text().strip().replace('-', ' ').capitalize().strip()} {i_css[5].text().strip().capitalize()}".replace(
            "  ", " "
        )
        day = i_css[6].text().strip()
        if "..." in day:
            continue
        data.append({"hicri_date": hicri_date, "date": date, "day": day})

    return jsonify(data)


@app.route("/radyolar")
def radyolar():
    try:
        with open("json/radios.json") as f:
            return jsonify(json.load(f))
    except:
        return jsonify([])


@app.route("/canlitv")
def canli_tv():
    r = requests.get("https://mp3quran.net/api/v3/live-tv")
    data = r.json()["livetv"]
    return jsonify([{"id": d["id"], "url": d["url"]} for d in data])


@app.route("/dualar")
def dualar():
    data = helper.daily_json("dualar")
    if not data:
        r = requests.get("https://esenler.bel.tr/esenlerde-ramazan/gunun-duasi/")
        node = LexborHTMLParser(r.text).css_first(".items > .container > ul").css("li")

        data = []
        for i in node:
            text = i.css_first(".text").text().strip()
            data.append(text)
        helper.daily_json("dualar", data)

    return jsonify(data)


@app.route("/aygoruntusu/<img>")
def ay_goruntusu(img):
    r = requests.get(f"https://namazvakti.diyanet.gov.tr/images/{img}", stream=True)
    if r.status_code == 200:
        image_data = io.BytesIO(r.content)

        return send_file(image_data, mimetype="image/gif")
    else:
        return "Error", 404
