import requests


class DeedApi(object):

    def __init__(self, host):
        self.deed_endpoint = "{}/deed/".format(host)

    def create_deed(self, mdref, title, lender,
                    borrowers, restrictions, provisions):
        payload = {
            'mdref': int(mdref),
            'title': dict(title),
            'lender': dict(lender),
            'borrowers': list(borrowers),
            'restrictions': list(restrictions),
            'provisions': list(provisions)
        }
        response = requests.post(self.deed_endpoint, json=payload)

        if response.status_code == 200:
            return int(response.json()['id'])
        else:
            response.raise_for_status()
