import requests
from app.case.model import Case
from app.borrower.model import Borrower
from app.property.model import Property
from app import config


class CaseApi(object):
    case_endpoint = "{}/case".format(config.CASE_API_BASE_HOST)

    def get_case_client(self):
        return requests.get(self.case_endpoint).json()

    def get_cases(self):
        cases_json = self.get_case_client()
        return [Case.from_json(item) for item in cases_json]

    def create_case(self, case_ref):
        payload = {
            "conveyancer_id": 1,
            "case_ref": case_ref
        }
        response = requests.post(self.case_endpoint, json=payload)

        if response.status_code == 201:
            return Case.from_json(response.json())
        else:
            response.raise_for_status()

    def update_case_with_deed(self, case_id, deed_id):
        payload = {
            "deed_id": deed_id
        }
        endpoint = "{case}/{case_id}/deed".format(
            case=self.case_endpoint,
            case_id=case_id
        )
        response = requests.post(endpoint, json=payload)

        if response.status_code == 200:
            return response
        else:
            response.raise_for_status()

    def get_borrowers(self, case_id):
        endpoint = "{case}/{case_id}/borrowers".format(
            case=self.case_endpoint,
            case_id=case_id
        )

        response = requests.get(endpoint)

        if response.status_code == 200:
            return [Borrower.from_json(item) for item in response.json()]
        elif response.status_code == 404:
            return None
        else:
            response.raise_for_status()

    def add_borrowers(self, case_id, borrowers):
        borrowers_json = [borrower.to_json() for borrower in borrowers]
        payload = {'borrowers': borrowers_json}

        endpoint = "{case}/{case_id}/borrowers".format(
            case=self.case_endpoint,
            case_id=case_id
        )
        response = requests.post(endpoint, json=payload)

        if response.status_code == 200:
            return [Borrower.from_json(item) for item in response.json()]
        else:
            response.raise_for_status()

    def submit_case(self, case_id):
        endpoint = "{case}/{case_id}/application".format(
            case=self.case_endpoint,
            case_id=case_id
        )
        response = requests.post(endpoint)

        if response.status_code == 200:
            return response
        else:
            response.raise_for_status()

    def add_property(self, case_id, property_):
        endpoint = "{case}/{case_id}/property".format(
            case=self.case_endpoint,
            case_id=case_id
        )

        payload = {'property': property_.to_json()}

        response = requests.post(endpoint, json=payload)

        if response.status_code == 200:
            return response
        else:
            response.raise_for_status()

    def get_property(self, case_id):
        endpoint = "{case}/{case_id}/property".format(
            case=self.case_endpoint,
            case_id=case_id
        )

        response = requests.get(endpoint)

        if response.status_code == 200:
            property_json = response.json()
            property_json['type'] = 'Property'
            return Property.from_json(property_json)
        elif response.status_code == 404:
            return None
        else:
            response.raise_for_status()
