from flask import request, abort
from app.deed import views
from flask.ext.api import status


def register_routes(blueprint, case_api, deed_api):
    @blueprint.route('/case/<case_id>/deed/new', methods=['POST', 'GET'])
    def create_deed(case_id):
        if request.method == 'POST':
            deed_id = deed_api.create_deed()
            case_api.update_case_with_deed(case_id, deed_id)
            return views.DeedCreated().render()
        elif request.method == 'GET':
            return views.CreateDeed().render()
        else:
            abort(status.HTTP_405_METHOD_NOT_ALLOWED)

    @blueprint.route('/case/deed/confirmation', methods=['GET'])
    def deed_created():
        views.DeedCreated().render()
