from flask import Flask
from flask.ext.script import Manager
from app import helloworld, static, case
from app.service.case_api import CaseApi
from govuk_template.flask import assets


def create_manager(case_api_=CaseApi()):
    app = Flask(__name__)
    app.config.from_pyfile('config.py')

    manager = Manager(app)

    static.register_assets(app)

    app.register_blueprint(helloworld.blueprint)
    app.register_blueprint(case.blueprint(case_api_))
    app.register_blueprint(assets.govuk_template, url_prefix='/template')

    return manager
