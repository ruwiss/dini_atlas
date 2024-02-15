from werkzeug.wrappers import Request, Response
from datetime import datetime
import helper


class Middleware:
    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        request = Request(environ)
        token = request.headers.get("token")
        create_token = helper.md5(f"{datetime.now().strftime('%Y-%m-%d')}-V47R3JNT")
        if token and token == create_token:
            environ["access"] = True
            return self.app(environ, start_response)
        else:
            res = Response("Unauthorized", status=401)
            return res(environ, start_response)
