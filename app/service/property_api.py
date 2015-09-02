from app.property.model import Property


class PropertyApi(object):
    PROPERTIES = {
        "LO3827": {
            "title_number": "LO3827",
            "street": "42A Broad Street",
            "extended": "Market Square",
            "locality": "Slough",
            "postcode": "SL2 1TP",
            "tenure": "freehold"
        },
        "LH1362": {
            "title_number": "LH1362",
            "street": "25B Friar Street",
            "locality": "Reading",
            "postcode": "RG1 1DP",
            "tenure": "leasehold"
        }
    }

    def get_property(self, title_number):
        if title_number in self.PROPERTIES:
            property_json = self.PROPERTIES.get(title_number)
            property_json['type'] = 'Property'
            return Property.from_json(property_json)
