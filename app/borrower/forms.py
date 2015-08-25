from flask_wtf import Form
from wtforms import StringField, validators


class AddBorrower(Form):
    first_name = StringField('first_name', [validators.DataRequired()])
    last_name = StringField('last_name', [validators.DataRequired()])
    mobile_no = StringField('mobile_no', [validators.DataRequired()])
    email_address = StringField('email_address', [validators.DataRequired()])
    locality = StringField('locality', [validators.DataRequired()])
    postcode = StringField('postcode', [validators.DataRequired()])
    street_address = StringField('street_address', [validators.DataRequired()])
