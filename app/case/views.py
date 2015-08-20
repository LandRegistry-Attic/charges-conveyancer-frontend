from app.views.template import Template
from flask import url_for


class Cases(Template):
    pageTitle = "Case list"

    def __init__(self, cases):
        def set_confirmation_available(case):
            case.confirmation_available = case.status == 'Deed signed'
            return case

        self.cases = [set_confirmation_available(item) for item in cases]


class Start(Template):
    pageTitle = "View your case list"

class Addborrower(Template):
    pageTitle = "Add a new borrower"


class CreateCase(Template):
    pageTitle = "Create a new case"

    def __init__(self, case=None):
        self.case = case
        self.case_list_url = url_for('case.case_list')


class ConfirmCompletion(Template):
    pageTitle = "Confirm completion date"

    def __init__(self, current_date):
        self.current_date = current_date
        self.case_list_url = url_for('case.case_list')
