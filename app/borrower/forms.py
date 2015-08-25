from flask_wtf import Form
from wtforms import StringField, validators


class AddBorrower(Form):
    first_name_msg = 'You have to enter First name'
    first_name = StringField('first_name',
                             [validators.DataRequired(first_name_msg)])
    middle_names = StringField('middle_names')
    last_name_msg = 'You have to enter Last name'
    last_name = StringField('last_name',
                            [validators.DataRequired(last_name_msg)])
    mobile_no_msg = 'You have to enter Mobile number'
    mobile_no = StringField('mobile_no',
                            [validators.DataRequired(mobile_no_msg)])
    email_address_msg = 'You have to enter correct Email address'
    email_address = StringField('email_address',
                                [validators.Email(email_address_msg)])
    locality_msg = 'You have to enter Locality'
    locality = StringField('locality',
                           [validators.DataRequired(locality_msg)])
    postcode_msg = 'You have to enter Postcode'
    postcode = StringField('postcode',
                           [validators.DataRequired(postcode_msg)])
    street_address_msg = 'You have to enter Street address'
    street_address = StringField('street_address',
                                 [validators.DataRequired(street_address_msg)])
    extended_address = StringField('extended_address')

    def get_attribute(self, attribute_name):
        if hasattr(self, attribute_name):
            attribute = getattr(self, attribute_name)
            data = getattr(attribute, 'data')
            if data is not None:
                return data
        return ''
