from tests.helpers import with_client, setUpApp, with_context
from unittest import TestCase


class TestViewCases (TestCase):

    def setUp(self):
        setUpApp(self)

    @with_context
    @with_client
    def test_view_cases(self, client):
        res = client.get('/cases')

        self.assertEqual(res.status_code, 200)
