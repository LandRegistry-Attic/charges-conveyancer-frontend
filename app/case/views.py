from app.views.template import Template


class Cases(Template):
    pageTitle = "Case list"

    def __init__(self, cases):
        self.cases = cases