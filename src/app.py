import logging
from datetime import datetime
from flask import Flask
from .routes import routes

app = Flask(__name__, static_folder='../static')

# Load config
app.config.from_prefixed_env()

# Enable logging
if app.config["LOG_ENABLED"]:
    logfile = app.config["LOG_DIR"] +  '/' + __name__ + '-' + datetime.now().strftime("%Y-%m-%d-%H-%M-%S")  + '.log'
    logging.basicConfig(filename=logfile, encoding='utf-8', level=logging.DEBUG)
else:
    logging.basicConfig(encoding='utf-8', level=logging.DEBUG)

app.register_blueprint(routes)

def create_app():
   return app