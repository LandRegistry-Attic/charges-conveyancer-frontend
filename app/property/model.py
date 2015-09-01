from app import json


class Property(json.Serialisable):
    def __init__(self, title_number, street, extended, locality, postcode):
        self.title_number = title_number
        self.street = street
        self.extended = extended
        self.locality = locality
        self.postcode = postcode

    def json_format(self):
        jsondata = {}

        def append(name, parameter):
            value = parameter(self)
            if value is not None:
                jsondata[name] = value

        append('title_number', lambda obj: obj.title_number)
        append('street', lambda obj: obj.street)
        append('extended', lambda obj: obj.extended)
        append('locality', lambda obj: obj.locality)
        append('postcode', lambda obj: obj.postcode)

        return jsondata

    def object_hook(dct):
        _title_number = dct.get('title_number')
        _street = dct.get('street')
        _extended = dct.get('extended', None)
        _locality = dct.get('locality')
        _postcode = dct.get('postcode')

        property_ = Property(
            _title_number,
            _street,
            _extended,
            _locality,
            _postcode
        )

        return property_
