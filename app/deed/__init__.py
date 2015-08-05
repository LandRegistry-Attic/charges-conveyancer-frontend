from flask import Blueprint
from . import routes


def blueprint(case_api, deed_api):
    _blueprint = Blueprint('deed', __name__)
    routes.register_routes(_blueprint, case_api, deed_api)
    return _blueprint
