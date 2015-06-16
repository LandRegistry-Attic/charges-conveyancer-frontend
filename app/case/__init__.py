from flask import Blueprint
from . import routes

blueprint = Blueprint('case', __name__)
routes.register_routes(blueprint)
