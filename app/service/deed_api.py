import requests
from app import config


class DeedApi(object):
    deed_endpoint = "{}/deed/".format(config.DEED_API_BASE_HOST)

    def create_deed(self):
        payload = {
            "mdref": "MD0149A",
            "title": {
                "title-number": "GHR67832",
                "address": {
                    "street-address": "18 Lordly Place",
                    "extended-address": "",
                    "locality": "London",
                    "postal-code": "N12 5TN"
                    }
                },
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
            "borrowers": [{
                "id": "1",
                "name": "Peter Smith",
                "address": {
                    "street-address": "83 Lordship Park",
                    "extended-address": "",
                    "locality": "London",
                    "postal-code": "N16 5UP"
                }
            },
                {
                "id": "2",
                "name": "John Smith",
                "address": {
                    "street-address": "83 Lordship Park",
                    "extended-address": "",
                    "locality": "London",
                    "postal-code": "N16 5UP"
                }
            }],
            "restrictions": ["This is my restriction"],
            "provisions": ["I am a provision"]
        }

        response = requests.post(self.deed_endpoint, json=payload)

        if response.status_code == 200:
            return str(response.json()['id'])
        else:
            response.raise_for_status()
