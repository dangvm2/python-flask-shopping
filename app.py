from flask import Flask, render_template, url_for, request, json, session
from flaskext.mysql import MySQL

import sys
sys.dont_write_bytecode = True #dont create pycache file

app = Flask(__name__)
app.config.from_pyfile("config.cfg")

from controller.layout import GetAllCategory
app.add_template_global(GetAllCategory, name="layout_GetAllCategory") #for use from jinja template


#### Route ####
from controller.index import index_blueprint
app.register_blueprint(index_blueprint)

from controller.cart import cart_blueprint
app.register_blueprint(cart_blueprint)

from controller.detail import detail_blueprint
app.register_blueprint(detail_blueprint)

from controller.layout import layout_blueprint
app.register_blueprint(layout_blueprint)

from controller.shop import shop_blueprint
app.register_blueprint(shop_blueprint)

#### Run ####
if __name__ == "__main__":
    #app.run()
    app.run(host='0.0.0.0', port=5000)