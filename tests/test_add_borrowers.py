from unittest import TestCase
from tests.helpers import with_client, setUpApp, with_context


class TestAddBorrowers(TestCase):
    def setUp(self):
        setUpApp(self)

    @with_context
    @with_client
    def test_add_borrowers_get(self, client):
        res = client.get('/case/1/borrower/new')

        self.assertEqual(res.status_code, 200)
        self.assertIn('Add a new borrower', res.data.decode())
