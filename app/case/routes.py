from flask import request, redirect, url_for
from app.case import views
from time import strftime


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
            case_ref = request.form.get('case_ref')
            case = case_api.create_case(case_ref)
            return redirect(url_for('case.case_details', case_id=case.id))
        else:
            return views.CreateCase().render()

    @blueprint.route('/case/<case_id>/details', methods=['GET'])
    def case_details(case_id):
        borrowers = case_api.get_borrowers(case_id)
        return views.CaseDetails(case_id, borrowers).render()

    @blueprint.route('/')
    def start_page():

        return views.Start().render()

    @blueprint.route('/case/<case_id>/deed/<deed_id>/completion',
                     methods=['GET', 'POST'])
    def confirm_case(case_id, deed_id):
        if request.method == 'POST':
            registrars_signature = 'THE_SIGNATURE'
            deed_api.confirm_completion(deed_id, registrars_signature)
            return redirect(url_for('case.case_list'))
        else:
            current_date = strftime("%d/%m/%Y")
            return views.ConfirmCompletion(current_date).render()

    @blueprint.route('/case/<case_id>/application', methods=['POST', 'GET'])
    def submit_case(case_id):
        if request.method == 'POST':
            case_api.submit_case(case_id)
            return redirect(url_for('case.case_list'))
        else:
            return views.SubmitCase().render()
