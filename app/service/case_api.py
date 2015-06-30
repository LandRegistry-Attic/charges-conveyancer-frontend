from flask import current_app
import requests
from app.case.model import case_from_json


def get_case_client():
    case_api_base_host = current_app.config['CASE_API_BASE_HOST']
    return requests.get(case_api_base_host + '/case').json()


def get_cases():
    cases_json = get_case_client()
    return [case_from_json(case) for case in cases_json]
