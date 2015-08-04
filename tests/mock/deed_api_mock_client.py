from app.service.deed_api import DeedApi
from flask import jsonify
from flask.ext.api import status


class DeedApiMockClient(DeedApi):
    def create_deed(self):
        return jsonify(status_code=status.HTTP_200_OK)
