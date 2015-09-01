from app.views.template import Template
from flask import url_for


class AddProperty(Template):
    pageTitle = "Add a property"

    def __init__(self, case_id, property_=None, invalid_title_number=False):
        self.case_details_url = url_for('case.case_details', case_id=case_id)
        self.add_property_url = url_for('property.add_property',
                                        case_id=case_id)
        self.property = property_

        if invalid_title_number:
            self.show_error_msg = True
