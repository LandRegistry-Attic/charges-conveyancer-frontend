from flask import Blueprint
from . import routes

blueprint = Blueprint('cases', __name__)
routes.register_routes(blueprint)
