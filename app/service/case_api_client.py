from flask import current_app
import requests

CASE_API_BASE_HOST = current_app.config['CASE_API_BASE_HOST']


class CaseApiClient:
    @staticmethod
    def get_cases():
        return requests.get(CASE_API_BASE_HOST + '/cases').json()
