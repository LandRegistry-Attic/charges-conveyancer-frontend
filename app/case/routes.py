from app.case import views
from app.service import case_api


def register_routes(blueprint):
    @blueprint.route('/cases')
    def case_list():
        cases = case_api.get_cases()
        return views.Cases(cases).render()
