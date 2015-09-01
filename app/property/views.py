from app.views.template import Template
from app.forms import FormHandler
from flask import url_for


class AddProperty(Template):
    pageTitle = "Add a new property"

    def __init__(self, case_id):
        self.case_details = url_for('case.case_details', case_id=case_id)

