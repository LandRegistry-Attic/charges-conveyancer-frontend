from app.borrower import views
from app.borrower.forms import AddBorrower
from app.borrower.model import Borrower
from flask import request, url_for, redirect


def register_routes(blueprint, case_api):
    @blueprint.route('/case/<case_id>/borrower/new', methods=['GET', 'POST'])
    def add_borrower(case_id):
        if request.method == 'POST':
            form = AddBorrower()

            if form.validate_on_submit():
                first_name = request.form['first_name']
                if 'middle_names' in request.form:
                    middle_names = request.form['middle_names']
                last_name = request.form['last_name']
                mobile_no = request.form['mobile_no']
                email_address = request.form['email_address']
                address = list()
                address.append(request.form['street_address'])
                if 'extended_address' in request.form:
                    address.append(request.form['extended_address'])
                address.append(request.form['locality'])
                address.append(request.form['postcode'])
                id = "" 

                borrower = Borrower(first_name,
                                    middle_names,
                                    last_name,
                                    mobile_no,
                                    email_address,
                                    address,
                                    id)

                case_api.add_borrowers(case_id, [borrower])
                return redirect(url_for('case.case_details', case_id=case_id))
            else:
                return views.AddBorrower(form, case_id).render()
        else:
            return views.AddBorrower(AddBorrower(), case_id).render()
