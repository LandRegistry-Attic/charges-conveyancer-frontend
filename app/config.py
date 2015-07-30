import os

DEBUG = True
CASE_API_BASE_HOST = os.getenv('CASE_API_BASE_HOST',
                               'http://0.0.0.0:7000')
DEED_API_BASE_HOST = os.getenv('DEED_API_BASE_HOST',
                               'http://0.0.0.0:10000')
