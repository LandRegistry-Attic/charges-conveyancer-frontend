from flask import request, redirect, url_for
from app.case import views


def register_routes(blueprint, case_api, deed_api):

    @blueprint.route('/cases')
    def case_list():

        def last_updated(case):
            return case.last_updated

        cases = case_api.get_cases()
        cases_sorted = sorted(cases, key=last_updated, reverse=True)

        return views.Cases(cases_sorted).render()

    @blueprint.route('/case/new', methods=['POST', 'GET'])
    def create_case():
        if request.method == 'POST':
            deed_id = 1
            case_api.create_case(deed_id)

            return redirect(url_for('case.case_list'))
        else:
            return views.CreateCase().render()

    @blueprint.route('/')
    def start_page():

        return views.Start().render()

    @blueprint.route('/case/<case_id>/deed/new')
    def create_deed(case_id):
        deed_id = deed_api.create_deed()
        case_api.update_case_with_deed(deed_id, case_id)

        return views.DeedCreated().render()
