from flask_wtf import Form
from wtforms import StringField, validators


class AddProperty(Form):
    title_number_msg = 'You have to enter Title number!'
    title_number = StringField('title_number',
                               [validators.DataRequired(title_number_msg)])

    def get_attribute(self, attribute_name):
        if hasattr(self, attribute_name):
            attribute = getattr(self, attribute_name)
            data = getattr(attribute, 'data')
            if data is not None:
                return data
        return ''
