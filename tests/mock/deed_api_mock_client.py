from app.service.deed_api import DeedApi
from flask import jsonify
from flask.ext.api import status


class DeedApiMockClient(DeedApi):
    def create_deed(self, case_id):
        return jsonify(status_code=status.HTTP_200_OK)

    def confirm_completion(self, deed_id, registrars_signature):
        return jsonify(status_code=status.HTTP_200_OK)
