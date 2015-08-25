from tests.helpers import with_client, setUpApp, with_context
from tests.mock.case_api_mock_client import CaseApiMockClient
from tests.mock.deed_api_mock_client import DeedApiMockClient
from unittest import TestCase


class TestViewCases(TestCase):
    def setUp(self):
        setUpApp(self,
                 case_api_=CaseApiMockClient(),
                 deed_api_=DeedApiMockClient())

    @with_context
    @with_client
    def test_view_cases(self, client):
        res = client.get('/cases')

        self.assertEqual(res.status_code, 200)

    @with_context
    @with_client
    def test_create_deed_post(self, client):
        res = client.post('/case/1/deed/new')

        self.assertEqual(res.status_code, 200)

    @with_context
    @with_client
    def test_create_deed_get(self, client):
        res = client.post('/case/1/deed/new')

        self.assertEqual(res.status_code, 200)

    @with_context
    @with_client
    def test_confirm_completion_post(self, client):
        res = client.post('/case/1/deed/1/completion')

        self.assertEqual(res.status_code, 302)

    @with_context
    @with_client
    def test_confirm_completion_get(self, client):
        res = client.get('/case/1/deed/1/completion')

        self.assertEqual(res.status_code, 200)

    @with_context
    @with_client
    def test_submit_case_post(self, client):
        res = client.post('/case/1/application')

        self.assertEqual(res.status_code, 302)

    @with_context
    @with_client
    def test_submit_case_get(self, client):
        res = client.get('/case/1/application')

        self.assertEqual(res.status_code, 200)
