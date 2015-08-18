from app.views.template import Template
from flask import url_for


class Cases(Template):
    pageTitle = "Case list"

    def __init__(self, cases):
        def set_available_actions(case):
            case.confirmation_available = case.status == 'Deed signed'
            case.application_available = case.status == 'Completion confirmed'

            return case

        self.cases = [set_available_actions(item) for item in cases]


class Start(Template):
    pageTitle = "View your case list"


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


class SubmitCase(Template):
    pageTitle = "Apply to register"

    def __init__(self):
        self.case_list_url = url_for('case.case_list')
