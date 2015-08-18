import os

DEBUG = True
CASE_API_BASE_HOST = os.getenv('CASE_API_BASE_HOST',
                               'http://case-api.dev.service.gov.uk')
DEED_API_BASE_HOST = os.getenv('DEED_API_BASE_HOST',
                               'http://deedapi.dev.service.gov.uk')
