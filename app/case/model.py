from dateutil.parser import parse


class Case:
    def __init__(self, id, deed_id, conveyancer_id,
                 status, created_on, last_updated, case_ref):
        self.id = id
        self.deed_id = deed_id
        self.conveyancer_id = conveyancer_id
        self.status = status
        self.created_on = created_on
        self.last_updated = last_updated
        self.case_ref = case_ref

    def get_readable_updated_date(self):
        return self.last_updated.strftime('%d/%m/%Y')


def case_from_json(case):
    return Case(
        case['id'],
        case.get('deed_id', None),
        case['conveyancer_id'],
        case['status'],
        parse(case['created_on']),
        parse(case['last_updated']),
        case.get('case_ref', '')
    )
