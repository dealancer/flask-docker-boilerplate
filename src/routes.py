from flask import Blueprint, current_app

routes = Blueprint('routes', __name__)
@routes.route("/")
def hello_world():
    current_app.logger.debug('Route "/" has been accessed.')
    return '<h1>Hello, World!</h1><img src="/static/img/flask.png">'
