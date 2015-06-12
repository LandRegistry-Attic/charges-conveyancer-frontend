import os

DEBUG = True
CASE_API_BASE_HOST = os.getenv('CASE_API_BASE_HOST', '')
# TODO change this line when we decide to use real CASE API
# CASE_CLIENT = 'app.service.case_api_client.CaseApiClient'
CASE_CLIENT = 'tests.mock.case_api_mock_client.CaseApiMockClient'
