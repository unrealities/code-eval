import sys

class FindAWriter:
    
    def __init__(self, msg):
        self.cipher = ''
        self.decodedMessage = ''
        self.encodedMessage = []
        
        self.parse(msg)
        self.decode()
        
    def parse(self, msg):
        encoded_message, self.cipher = msg.split('| ')
        self.encodedMessage = list(encoded_message)
        
    def decode(self):
        for num in self.cipher.split(' '):
            self.decodedMessage += self.encodedMessage[int(num)-1]


class FindWriters:
    
    def __init__(self, inputs):
        for line in inputs:
            print(FindAWriter(line).decodedMessage)
        inputs.close()


FindWriters(open(sys.argv[1], 'r'))
