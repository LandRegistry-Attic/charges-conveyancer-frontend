import os

DEBUG = True
CASE_API_BASE_HOST = os.getenv('CASE_API_BASE_HOST',
                               'http://10.10.10.10:7000')
DEED_API_BASE_HOST = os.getenv('DEED_API_BASE_HOST',
                               'http://10.10.10.10:8000')
