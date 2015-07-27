from app.views.template import Template


class CreateMortgage(Template):
    pageTitle = "Create a Mortgage Deed"

    def __init__(self, case=None):
        self.case = case
