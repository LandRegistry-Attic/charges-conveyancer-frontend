class Borrower:
    def __init__(self, first_name, middle_names, last_name,
                 mobile_no, email_address, address, id):
        self.first_name = first_name
        self.middle_names = middle_names
        self.last_name = last_name
        self.mobile_no = mobile_no
        self.email_address = email_address
        self.address = address
        self.id = id

    @staticmethod
    def from_json(borrower_json):
        return Borrower(borrower_json['first_name'],
                        borrower_json.get('middle_names', None),
                        borrower_json['last_name'],
                        borrower_json['mobile_no'],
                        borrower_json['email_address'],
                        borrower_json['address'],
                        borrower_json.get('id', None)) 

    def to_json(self):
        return {'first_name': self.first_name,
                'last_name': self.last_name,
                'middle_names': self.middle_names,
                'mobile_no': self.mobile_no,
                'email_address': self.email_address,
                'address': self.address}
