from app.property import views
from app.property.model import Property
from flask import request, url_for, redirect


def register_routes(blueprint, case_api, property_api):
    @blueprint.route('/case/<case_id>/property/search',
                     methods=['GET', 'POST'])
    def search_property(case_id):
        if request.method == 'GET':
            return views.AddProperty(case_id).render()
        else:
            title_number = request.form['title_number']
            property_ = property_api.get_property(title_number)
            return views.AddProperty(case_id,
                                     property_,
                                     property_ is None).render()

    @blueprint.route('/case/<case_id>/property/new', methods=['POST'])
    def add_property(case_id):
        title_number = request.form['title_number']
        street = request.form['street']
        extended = request.form.get('extended', None)
        locality = request.form['locality']
        postcode = request.form['postcode']

        property_ = Property(title_number, street, extended,
                             locality, postcode)

        case_api.add_property(case_id, property_)

        return redirect(url_for('case.case_details', case_id=case_id))
