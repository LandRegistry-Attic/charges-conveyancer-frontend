from flask import redirect, url_for
from app.mortgage import views


def register_routes(blueprint):

    @blueprint.route('/case/<int:case_id>/mortgage/new')
    def new_mortgage(case_id):
        return views.CreateMortgage().render()

    @blueprint.route('/case/<int:case_id>/mortgage/new', methods=['POST'])
    def create_mortgage(case_id):
        return redirect(url_for('case.case_list'))
