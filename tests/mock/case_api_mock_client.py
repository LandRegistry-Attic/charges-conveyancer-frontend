from tests.mock.mock_response import MockJsonResponse


class CaseApiMockClient:
    @staticmethod
    def get_cases():
        cases = [{"reference": "1000",
                  "clients": ["John Smith", "Alice Young"],
                  "task": "Remortgage",
                  "status": "Draft",
                  "last_updated": "20.05.2014"},
                 {"reference": "2000",
                  "clients": ["Andrew Smith", "Mary Young"],
                  "task": "Remortgage",
                  "status": "Draft",
                  "last_updated": "25.05.2013"}]
        return MockJsonResponse(cases)
