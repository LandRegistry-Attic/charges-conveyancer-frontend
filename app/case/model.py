from dateutil.parser import parse


class Case:
    def __init__(self, id, deed_id, conveyancer_id,
                 status, created_on, last_updated):
        self.id = id
        self.deed_id = deed_id
        self.conveyancer_id = conveyancer_id
        self.status = status
        self.created_on = created_on
        self.last_updated = last_updated

    def get_readable_updated_date(self):
        return self.last_updated.strftime('%d/%m/%Y')


def case_from_json(case):
    return Case(case['id'],
                case['deed_id'],
                case['conveyancer_id'],
                case['status'],
                parse(case['created_on']),
                parse(case['last_updated'])
                )
