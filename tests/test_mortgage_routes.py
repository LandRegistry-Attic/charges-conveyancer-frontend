from tests.helpers import with_client, setUpApp, with_context
import unittest


class FauxDeedApi(object):

    def __init__(self, testcase):
        self.testcase = testcase
        self.log = []

    def expect_deed_created(self, mdref):
        self.testcase.assertIn(
            'deed created mdref {}'.format(mdref),
            self.log
        )

    def create_deed(self, mdref, title, lender,
                    borrowers, restrictions, provisions):
        self.log.append('deed created mdref {}'.format(mdref))
        deed_id = 1234
        return deed_id


class TestMortgageRoutes(unittest.TestCase):

    def setUp(self):
        self.faux_deed_api = FauxDeedApi(self)
        setUpApp(self,
                 deed_api_=self.faux_deed_api)

    @with_context
    @with_client
    def test_create_mortgage(self, client):
        res = client.post('/case/1/mortgage/new')

        self.faux_deed_api.expect_deed_created(1)

        self.assertEqual(res.status_code, 302)
        self.assertIn('/cases', res.location)
