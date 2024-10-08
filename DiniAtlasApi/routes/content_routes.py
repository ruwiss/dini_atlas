from flask import Blueprint, redirect, request, jsonify, Response, send_file
from selectolax.lexbor import LexborHTMLParser
from datetime import datetime
from markupsafe import escape
import requests
from random import shuffle
from connect import get_cursor
import helper
import json
import os

app = Blueprint("content_app", __name__)

# Geçici dosyanın kaydedileceği dizin
TEMP_FOLDER = "temp"
if not os.path.exists(TEMP_FOLDER):
    os.makedirs(TEMP_FOLDER)


@app.route("/")
def index():
    return "OK"


@app.route("/kuran/sayfalar/<sayfa>")
def kuran_sayfalar(sayfa):
    page_url = f"https://www.mp3quran.net/api/quran_pages_svg/{sayfa}"
    response = requests.get(page_url)
    return Response(response.content, mimetype="image/svg+xml")


@app.route("/kuran/sureler")
def sure_listesi():
    cursor = get_cursor()
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
    cursor = get_cursor()
    if sayfa:
        cursor.execute("SELECT * FROM sureler WHERE sayfa = %s", (sayfa,))
        sure_data = cursor.fetchone()

        if not sure_data:
            return jsonify({})

        cursor.execute(
            """SELECT * FROM kuran WHERE sure = %s ORDER BY ayet ASC LIMIT 10 OFFSET %s""",
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
                """SELECT * FROM kuran
      WHERE sure = %s AND ayet >= %s
      ORDER BY ayet ASC
      LIMIT 10 OFFSET %s;
      """,
                (sure, ayet, offset),
            )
            ayetler = cursor.fetchall()
            return jsonify({"sure": sure_data, "ayetler": ayetler})


@app.route("/hadis/riyazus_salihin")
@app.route("/hadis/riyazus_salihin/<int:hadis_id>")
def hadis(hadis_id=None):
    cursor = get_cursor()
    offset = int(request.args.get("offset", 0))
    limit = 5 if not hadis_id else 1
    if hadis_id:
        cursor.execute("SELECT * FROM riyazus_salihin WHERE hadis_id = %s", (hadis_id,))
        hadis = cursor.fetchone()
        hadis["arapca"] = helper.remove_html_tags(hadis["arapca"])
        hadis["turkce"] = helper.remove_html_tags(hadis["turkce"])
        return jsonify([hadis])
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
    cursor = get_cursor()
    query = request.args.get("query", None)
    offset = int(request.args.get("offset", 0))
    if not query:
        return jsonify([])
    cursor.execute(
        f"""
        SELECT * FROM riyazus_salihin WHERE baslik LIKE %s OR turkce LIKE %s
        ORDER BY CASE
        WHEN baslik LIKE %s
        THEN 1
        WHEN turkce LIKE %s
        THEN 2
        ELSE 3
        END LIMIT 5 OFFSET %s;""",
        (f"%{query}%", f"%{query}%", f"%{query}%", f"%{query}%", offset),
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
        if i["id"] in [51, 256]:
            continue
        server = i["folder_url"].split(".mp3quran.net")[0].split("/")[2]
        server_folder = i["folder_url"].split(".mp3quran.net/")[1].replace("/", "")
        name = (
            i["name"]
            .replace("إبراهيم الأخضر", "Ibrahim Al Akhdar")
            .replace("أحمد بن علي العجمي", "Ahmad bin Ali Al-Ajmi")
            .replace("أحمد نعينع", "Ahmed Neinaa")
            .replace("أكرم العلاقمي", "Akram Al Alaqmi")
            .replace("سعود الشريم", "Suud el-Şureym")
            .replace("سهل ياسين", "Sahil Yaseen")
            .replace("عبدالباسط عبدالصمد", "Abdulbasit Abdussamed")
            .replace("عبدالله بصفر", "Abdullah Ibn Ali Basfar")
            .replace("عبدالله عواد الجهني", "Abdullah el-Cuheni")
            .replace("عبدالمحسن القاسم", "Abdulmohsen Al-Qasim")
            .replace("علي بن عبدالرحمن الحذيفي", "Ali Al-Hudhaifi")
            .replace("علي حجاج السويسي", "Sheikh Ali As-Suwaisy")
            .replace("عماد زهير حافظ", "Imad Zuhair Hafez")
            .replace("محمد الطبلاوي", "Mohammed Al-Tablawi")
            .replace("محمد صديق المنشاوي", "Mohammed Manshawi")
            .replace("محمود خليل الحصري", "Mahmoud Khalil Al-Husary")
            .replace("خالد المهنا", "Khaled Al-Muhanna")
        )
        if i["soar_count"] == 114:
            okuyucular.append(
                {
                    "id": i["id"],
                    "name": name,
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
                    "id": int(mp3.split(".")[0]),
                    "url": f"/kuran/ayet_takibi/{server}/{server_folder}/{id}/{str(int(mp3.split('.')[0]))}",
                }
            )
        except:
            pass

    return jsonify({"okuyucuId": id, "liste": sure_list})


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
    data = helper.daily_json("dini_gunler")
    if data:
        return jsonify(data)

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

    helper.daily_json("dini_gunler", data)
    return jsonify(data)


@app.route("/radyolar")
def radyolar():
    radios_path = "json/radios.json"
    if os.path.exists(radios_path):
        with open(radios_path) as f:
            data = json.load(f)
            try:
                d = helper.fetch_radios()
                return jsonify(d["radios"])
            except:
                return jsonify(data["radios"])
    else:
        return []


@app.route("/aygoruntusu/<img>")
def ay_goruntusu(img):
    return redirect(f"https://namazvakti.diyanet.gov.tr/images/{img}")


@app.route("/daily-zip")
def daily_zip():
    return send_file("json/daily.zip")


@app.route("/daily")
def stories():
    datestr = datetime.now().strftime("%d-%m-%Y")
    stories_path = f"json/daily/{datestr}.json"
    if os.path.exists(stories_path):
        with open(stories_path, encoding="utf-8") as f:
            return jsonify(json.load(f))
    else:
        return "Error", 500


@app.route("/story/<media>")
def story_media(media):
    media_path = f"json/daily/story_media/{media}"
    if os.path.exists(media_path):
        pass
    else:
        return "Error", 501
    return send_file(media_path, as_attachment=True)


@app.route("/feedback", methods=["POST"])
def user_feedback():
    if request.method == "POST":
        image_file = request.files["image"]
        text = request.form["text"]

        token = "6421456783:AAE_N4mD1sTL-YuhiqKOF9EC8gz9z2tnWAg"
        chat_id = "-1002033217313"

        temp_image_path = os.path.join(TEMP_FOLDER, f"temp_image_{len(text)}.png")
        image_file.save(temp_image_path)

        url = f"https://api.telegram.org/bot{token}/sendPhoto"
        files = {"photo": open(temp_image_path, "rb")}
        params = {"chat_id": chat_id, "caption": text}
        requests.post(url, data=params, files=files)
        os.remove(temp_image_path)

        return "OK"
