from flask import redirect, url_for
from app.mortgage import views


def register_routes(blueprint, deed_api):

    @blueprint.route('/case/<int:case_id>/mortgage/new')
    def new_mortgage(case_id):
        return views.CreateMortgage().render()

    @blueprint.route('/case/<int:case_id>/mortgage/new', methods=['POST'])
    def create_mortgage(case_id):
        mdref = 1
        title = {
            'title-number': 'GHR67832',
            'address': {
              'street-address': '18 Lordly Place',
              'extended-address': '',
              'locality': 'London',
              'postal-code': 'N12 5TN'
            }
        }
        lender = {
            'name': 'Bank of England PLC',
            'company-number': '2347672',
            'address': {
                'street-address': '12 Trinity Place',
                'extended-address': 'Regents Street',
                'locality': 'London',
                'postal-code': 'NW10 6TQ'
            }
        }
        borrowers = [{
            'id': '1',
            'name': 'Peter Smith',
            'address': {
                'street-address': '83 Lordship Park',
                'extended-address': '',
                'locality': 'London',
                'postal-code': 'N16 5UP'
            }
        }, {
            'id': '2',
            'name': 'Sarah Jane Smith',
            'address': {
                'street-address': '25 Hanger Lane',
                'extended-address': 'Harrow',
                'locality': 'London',
                'postal-code': 'N11 8RD'
            }
        }]
        restrictions = [
            "You can't have an elephant in your garden"
        ]
        provisions = []
        deed_api.create_deed(mdref, title, lender,
                             borrowers, restrictions, provisions)
        return redirect(url_for('case.case_list'))
