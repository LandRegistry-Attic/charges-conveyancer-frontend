class Case:
    def __init__(self, deed_id, clients, task, status, last_updated):
        self.deed_id = deed_id
        self.clients = clients
        self.status = status
        self.task = task
        self.last_updated = last_updated
