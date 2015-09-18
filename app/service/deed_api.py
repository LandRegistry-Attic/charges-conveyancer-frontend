import requests
from app import config


class DeedApi(object):
    deed_endpoint = "{}/deed/".format(config.DEED_API_BASE_HOST)

    def create_deed(self, case_id):

        payload = {
            "mdref": "MD0149A",
            "lender": {
                "name": "Bank of England PLC",
                "company-number": "2347672",
                "address": {
                    "street-address": "12 Trinity Place",
                    "extended-address": "Regents Street",
                    "locality": "London",
                    "postal-code": "NW10 6TQ"
                }
            },
            "case_id": case_id,
            "restrictions": ["This is my restriction"],
            "provisions": ["I am a provision"]
        }

        print(payload)
        response = requests.post(self.deed_endpoint, json=payload)

        if response.status_code == 200:
            return str(response.json()['id'])
        else:
            response.raise_for_status()

    def confirm_completion(self, deed_id, registrars_signature):
        payload = {
            'registrars-signature': registrars_signature
        }

        address = self.deed_endpoint + '{}/completion'.format(deed_id)
        response = requests.post(address, data=payload)

        if response.status_code != 200:
            response.raise_for_status()
