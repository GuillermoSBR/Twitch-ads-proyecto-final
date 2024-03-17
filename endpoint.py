from ctypes.wintypes import HACCEL
from flask import Flask, render_template, make_response
import os
import time

from main import *

PEOPLE_FOLDER = os.path.join('', 'people_photo')

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = PEOPLE_FOLDER


@app.route('/', methods=["GET"])
def show_index():
    resp = make_response(render_template("index.html", user_image="/static/ad.gif"))
    resp.cache_control.no_store = True
    resp.cache_control.max_age = 300
    return resp

@app.route('/buttons', methods=["GET"])
def show_buttons():
    return render_template("/buttons.html")


@app.route('/change_ad/<ad_name>', methods=["GET"])
def change_ad(ad_name):
    get_ad(ad_name)

    return "Ad cargado correctamente"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
