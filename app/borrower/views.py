from app.views.template import Template
from app.forms import FormHandler
from flask import url_for


class AddBorrower(Template, FormHandler):
    pageTitle = "Add a new borrower"

    def __init__(self, form, case_id):
        self.create_case_url = url_for('case.case_details', case_id = case_id)
        self.form = form
        self.has_errors = form.errors != {}
