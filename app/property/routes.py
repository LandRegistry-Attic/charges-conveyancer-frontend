from app.property import views
from app.borrower.forms import AddBorrower
from app.borrower.model import Borrower
from flask import request, url_for, redirect


def register_routes(blueprint, case_api):
    @blueprint.route('/case/<case_id>/property/new', methods=['GET', 'POST'])
    def add_property(case_id):
        return views.AddProperty(case_id).render()
