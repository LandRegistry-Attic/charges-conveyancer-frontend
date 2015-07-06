from flask import current_app
import requests
from app.case.model import case_from_json


class CaseApi(object):

    def get_case_client(self):
        case_api_base_host = current_app.config['CASE_API_BASE_HOST']
        return requests.get(case_api_base_host + '/case').json()

    def get_cases(self):
        cases_json = self.get_case_client()
        return [case_from_json(case) for case in cases_json]
