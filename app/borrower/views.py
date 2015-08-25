from app.views.template import Template
from app.forms import FormHandler
from flask import url_for


class AddBorrower(Template, FormHandler):
    pageTitle = "Add a new borrower"

    def __init__(self, form, case_id):
        self.create_case_url = url_for('case.case_details', case_id=case_id)
        self.form = form
        self.has_errors = form.errors != {}

        self.first_name = form.get_attribute('first_name')
        self.last_name = form.get_attribute('last_name')
        self.middle_names = form.get_attribute('middle_names')
        self.mobile_no = form.get_attribute('mobile_no')
        self.email_address = form.get_attribute('email_address')
        self.locality = form.get_attribute('locality')
        self.postcode = form.get_attribute('postcode')
        self.street_address = form.get_attribute('street_address')
        self.extended_address = form.get_attribute('extended_address')
