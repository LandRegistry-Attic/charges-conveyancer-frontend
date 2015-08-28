from app.views.template import Template
from flask import url_for


class Cases(Template):
    pageTitle = "Case list"

    def __init__(self, cases):
        def set_available_actions(case):
            case.confirmation_available = case.status == 'Deed signed'
            case.application_available = case.status == 'Completion confirmed'

            return case

        def set_borrower_names(case):
            case.borrower_names = []
            for borrower in case.borrowers:
                name = borrower.first_name

                if borrower.middle_names is not None:
                    name += ' ' + borrower.middle_names

                case.borrower_names.append(name + ' ' + borrower.last_name)
            return case

        self.cases = [set_available_actions(item) for item in cases]
        self.cases = [set_borrower_names(item) for item in cases]


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


class CaseDetails(Template):
    pageTitle = "Case details"

    def __init__(self, case_id, borrowers):
        self.case_list_url = url_for('case.case_list')
        self.add_borrower_url = url_for('borrower.add_borrower',
                                        case_id=case_id)

        def set_full_names(borrower):
            full_name = borrower.first_name

            if borrower.middle_names is not None:
                full_name += ' ' + borrower.middle_names

            borrower.full_name = full_name + ' ' + borrower.last_name
            return borrower

        self.borrowers = [set_full_names(item) for item in borrowers]
        self.has_borrowers = borrowers != []
