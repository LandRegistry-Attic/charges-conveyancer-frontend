class Case:
    def __init__(self, reference, clients, task, status, last_updated):
        self.reference = reference
        self.clients = clients
        self.status = status
        self.task = task
        self.last_updated = last_updated
