from flask import Blueprint
from . import routes


def blueprint(case_api):
    _blueprint = Blueprint('borrower', __name__)
    routes.register_routes(_blueprint, case_api)
    return _blueprint
