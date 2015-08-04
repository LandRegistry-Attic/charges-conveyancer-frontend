from app.views.template import Template


class Cases(Template):
    pageTitle = "Case list"

    def __init__(self, cases):
        self.cases = cases


class Start(Template):
    pageTitle = "View your case list"


class CreateCase(Template):
    pageTitle = "Create a new case"

    def __init__(self, case=None):
        self.case = case
