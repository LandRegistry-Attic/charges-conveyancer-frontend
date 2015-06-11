from pydoc import locate
from flask import current_app
from app.service.model import Case


def get_case_client():
    return locate(current_app.config['CASE_CLIENT'])


def get_cases():
    def case_from_json(case):
        return Case(case.get('deed_id'),
                    case.get('clients'),
                    case.get('task'),
                    case.get('status'),
                    case.get('last_updated'))

    cases_json = get_case_client().get_cases()
    return [case_from_json(case) for case in cases_json]
