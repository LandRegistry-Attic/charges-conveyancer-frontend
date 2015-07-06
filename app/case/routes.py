from app.case import views
from app.service import case_api


def register_routes(blueprint):
    @blueprint.route('/cases')
    def case_list():
        cases = case_api.get_cases()
        key = lambda case: case.last_updated

        cases_sorted = sorted(cases, key=key, reverse=True)

        return views.Cases(cases_sorted).render()

    @blueprint.route('/')
    def start_page():

        return views.Start().render()
