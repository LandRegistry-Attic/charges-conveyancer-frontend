from flask import Blueprint
from . import routes


def blueprint(case_api, property_api):
    _blueprint = Blueprint('property', __name__)
    routes.register_routes(_blueprint, case_api, property_api)
    return _blueprint
