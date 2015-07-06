from app.service.case_api import CaseApi


class CaseApiMockClient(CaseApi):
    def get_case_client(self):
        cases = [
            {
                "status": "submitted",
                "id": 1,
                "created_on": "2015-04-20T03:30:51",
                "conveyancer_id": 1,
                "last_updated": "2015-05-12T20:15:24",
                "type": "Case",
                "deed_id": 1
            }, {
                "status": "submitted",
                "id": 2,
                "created_on": "2015-04-21T03:30:51",
                "conveyancer_id": 1,
                "last_updated": "2015-05-06T20:15:24",
                "type": "Case",
                "deed_id": 2
            }
        ]
        return cases
