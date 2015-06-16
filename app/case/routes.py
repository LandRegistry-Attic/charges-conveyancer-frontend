from app.case import views
from app.service import case_api
from datetime import datetime


def register_routes(blueprint):
    @blueprint.route('/cases')
    def case_list():
        cases = case_api.get_cases()
        key = lambda case: datetime.strptime(case.last_updated, '%d.%m.%Y')
        cases_sorted = sorted(cases, key=key, reverse=True)
        return views.Cases(cases_sorted).render()
