from tests.mock.mock_response import MockJsonResponse


class CaseApiMockClient:
    @staticmethod
    def get_cases():
        cases = [{"reference": "1000",
                  "clients": ["John Smith", "Alice Young"],
                  "task": "Remortgage",
                  "status": "Draft",
                  "last_updated": "20 May 2014"}]
        return MockJsonResponse(cases)
