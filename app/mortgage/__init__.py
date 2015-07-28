from flask import Blueprint
from app.mortgage import routes


def blueprint(deed_api):
    _blueprint = Blueprint('mortgage', __name__)

    routes.register_routes(_blueprint, deed_api)

    return _blueprint
