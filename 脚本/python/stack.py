class Stack:
    def __init__(self):
        self.data = []

    def push(self,e):
        self.data.append(e)

    def pop(self):
        if self.is_empty():
            print('Stack is Null!')
        self.data.pop()

    def top(self):
        if self.is_empty():
            print('Stack is Null!')
        print(self.data[-1])

    def is_empty(self):
        return len(self.data) == 0

    def size(self):
        return len(self.data)












