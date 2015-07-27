from flask import Blueprint
from app.mortgage import routes


def blueprint():
    _blueprint = Blueprint('mortgage', __name__)

    routes.register_routes(_blueprint)

    return _blueprint
