import requests
from app.case.model import case_from_json
from app import config


class CaseApi(object):
    case_endpoint = "{}/case".format(config.CASE_API_BASE_HOST)

    def get_case_client(self):
        return requests.get(self.case_endpoint).json()

    def get_cases(self):
        cases_json = self.get_case_client()
        return [case_from_json(case) for case in cases_json]

    def create_case(self, deed_id):
        payload = {
            "conveyancer_id": 1,
            "deed_id": 1
        }
        response = requests.post(self.case_endpoint, json=payload)

        if response.status_code == 201:
            return case_from_json(response.json())
        else:
            response.raise_for_status()

    def update_case_with_deed(self, deed_id, case_id):
        payload = {
            "deed_id": deed_id
        }
        endpoint = self.case_endpoint + "/" + case_id + "/deed"
        response = requests.post(endpoint, json=payload)

        if response.status_code == 200:
            return response
        else:
            response.raise_for_status()
