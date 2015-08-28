import os

DEBUG = True
CASE_API_BASE_HOST = os.getenv('CASE_API_BASE_HOST',
                               'http://case-api.dev.service.gov.uk')
DEED_API_BASE_HOST = os.getenv('DEED_API_BASE_HOST',
                               'http://deedapi.dev.service.gov.uk')
SECRET_KEY = os.getenv('CONVEYANCER_FE_SECRET_KEY',
                       'a8a8652e-98e8-491f-aab5-d1faf31008ca')
