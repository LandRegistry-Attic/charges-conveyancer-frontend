from app.service.case_api import CaseApi
from flask import jsonify
from flask.ext.api import status


class CaseApiMockClient(CaseApi):
    def get_case_client(self):
        cases = {
            "1": {
                "status": "Case created",
                "borrowers": [
                    {
                        "email_address": "adds@a.pp",
                        "address": [
                            "a",
                            "b"
                        ],
                        "last_name": "K",
                        "type": "Borrower",
                        "first_name": "D",
                        "middle_names": "M",
                        "id": 1,
                        "case_id": 1,
                        "mobile_no": "33322323"
                    }
                ],
                "last_updated": "2015-08-20T13:26:42.829323",
                "case_ref": "",
                "id": 1,
                "conveyancer_id": 1,
                "created_on": "2015-08-20T13:26:42.829401"
            }
        }

        return cases

    def update_case_with_deed(self, case_id, deed_id):
        return jsonify(status_code=status.HTTP_200_OK)

    def get_borrowers(self, case_id):
        return {}
