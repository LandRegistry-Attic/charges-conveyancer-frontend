import os

DEBUG = True
CASE_API_BASE_HOST = os.getenv('CASE_API_BASE_HOST', '')
CASE_CLIENT = 'app.service.case_api_client.CaseApiClient'
