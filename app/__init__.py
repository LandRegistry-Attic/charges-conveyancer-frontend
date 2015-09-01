from flask import Flask
from flask.ext.script import Manager
from app import helloworld, static, case, deed, borrower, property
from app.service.case_api import CaseApi
from app.service.deed_api import DeedApi
from govuk_template.flask import assets


def create_manager(case_api_=CaseApi(), deed_api_=DeedApi()):
    app = Flask(__name__)
    app.config.from_pyfile('config.py')

    manager = Manager(app)
    static.register_assets(app)

    app.register_blueprint(helloworld.blueprint)
    app.register_blueprint(case.blueprint(case_api_, deed_api_))
    app.register_blueprint(deed.blueprint(case_api_, deed_api_))
    app.register_blueprint(borrower.blueprint(case_api_))
    app.register_blueprint(property.blueprint(case_api_))
    app.register_blueprint(assets.govuk_template, url_prefix='/template')

    return manager
