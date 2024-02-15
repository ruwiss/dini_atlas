from routes.content_routes import app as content_app
from routes.user_routes import app as user_app
from routes.middleware import Middleware
from flask import Flask
import helper

app = Flask(__name__)
app.wsgi_app = Middleware(app.wsgi_app)

app.config["JSON_AS_ASCII"] = False
app.config["JSONIFY_MIMETYPE"] = "application/json; charset=utf-8"

app.register_blueprint(content_app)
app.register_blueprint(user_app, url_prefix="/kullanici")

# header { token: md5(datetime(Y:m:d)-V47R3JNT) }

# GET https://ezanvakti.herokuapp.com/ Ezan Vakitleri

# GET /kuran/sureler
# GET /kuran?sure=1&ayet=1&offset=10

# GET /hadis/riyazus_salihin?offset=5
# GET /hadis/riyazus_salihin/<hadis_id>
# GET /hadis/riyazus_salihin/ara?query=abc&offset=5

# GET /kuran/okuyucular (okuyucu listesi)
# GET /kuran/okuyucu/<server>/<server_folder>/<int:id> (okuyucunun sure listesi)
# GET /kuran/ayet_takibi/<server>/<server_folder>/<int:id>/<int:sure> (surenin mp3 linki ve zamanlama listesi)

# GET /dinigunler
# GET /radyolar
# GET /canlitv
# GET /dualar

# GET /kullanici/auth?mail=xxx&password=xxx
# POST /kullanici/auth?mail=xxx&password=xxx

# GET /kullanici/kaza?mail=xxx&password=xxx
# POST /kullanici/kaza?mail=xxx&password=xxx&data=xxx

if __name__ == "__main__":
    helper.fetch_radios()
    app.run(debug=True, host="0.0.0.0", port=9976)
