from app.case import views


def register_routes(blueprint, case_api):

    @blueprint.route('/cases')
    def case_list():

        def last_updated(case): return case.last_updated

        cases = case_api.get_cases()
        cases_sorted = sorted(cases, key=last_updated, reverse=True)

        return views.Cases(cases_sorted).render()

    @blueprint.route('/')
    def start_page():

        return views.Start().render()
