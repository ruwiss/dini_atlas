from datetime import datetime
import requests
import hashlib
import json
import re
import os


def md5(val):
    return hashlib.md5(val.encode("utf-8")).hexdigest()


def remove_html_tags(html) -> str:
    CLEANR = re.compile("<.*?>")
    return re.sub(CLEANR, "", html)


def get_radio_names():
    return [
        "lalegul",
        "diyanet kur",
        "diyanet radyo",
        "erkam",
        "semerkand",
        "akra fm",
        "risalet",
        "vav radyo",
        "radyo gul",
        "bayram",
        "dost fm",
        "ribat fm",
        "enderun",
        "gözyaşı",
    ]


def fetch_radios():
    current_directory = os.getcwd()
    json_folder_path = os.path.join(current_directory, "json")
    if not os.path.exists(json_folder_path):
        os.makedirs(json_folder_path)

    radios_json_path = os.path.join(json_folder_path, "radios.json")
    if not os.path.exists(radios_json_path):
        radio_list = []
        for name in get_radio_names():
            r = requests.get(
                f"http://de1.api.radio-browser.info/json/stations/byname/{name.replace(' ', '%20')}"
            )
            data = r.json()[0]
            print(f"{data['name']} - {data['url_resolved']}")
            radio_list.append({"name": data["name"], "url": data["url_resolved"]})
        with open(radios_json_path, "w") as f:
            json.dump(radio_list, f)


def daily_json(name, data=None):
    current_day = datetime.now().day
    filename = f"json/{name}-{current_day}.json"

    if data:
        with open(filename, "w", encoding="utf-8") as f:
            json.dump(data, f, ensure_ascii=False, indent=2)
    else:
        try:
            with open(filename, "r", encoding="utf-8") as f:
                existing_data = json.load(f)
                return existing_data

        except FileNotFoundError:
            old_filename = f"json/{name}-{current_day - 1}.json"
            if os.path.exists(old_filename):
                os.remove(old_filename)
