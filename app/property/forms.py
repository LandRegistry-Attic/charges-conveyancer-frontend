from flask_wtf import Form
from wtforms import StringField, validators


class AddProperty(Form):
    title_number_msg = 'You have to enter Title number!'
    title_number = StringField('title_number',
                               [validators.DataRequired(title_number_msg)])
