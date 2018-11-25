
class Predicate:
    def __init__(self, functor = None, args = None):
        self.functor = functor
        self.args = args

class Clause:
    def __init__(self, head = None, body = None):
        self.head = head
        self.body = body

def ParseClause(clause):
    result = Clause()
    index = clause.find(":-")
    if index < 0:
        result.head = ParseHead(clause)
    else:
        head = clause[:index]
        body = clause[index + 2: len(clause) - 1]
        #Loai bo khoang trang du thua
        head = head.rstrip()
        body = body.lstrip()
        #
        result.head = ParseHead(head)
        result.body = ParseBody(body)
    return result

def ParseHead(predicate):
    if predicate == "":
        return None
    result = Predicate()
    data = predicate.split('(', 1)
    if data[0][0] < 'a' or data[0][0] > 'z':
       raise Exception(data[0] + " must start with lower case letters!!!")
    result.functor = data[0]
    if len(data) == 1:
        return result

    result.args = ParseArgs(data[1])
    '''
    args = (data[1].split(')')[0]).split(',')
    for i in range(len(args)):
        args[i] = args[i].rstrip()
        args[i] = args[i].lstrip()
        if args[i].find('(') >= 0:
            args[i] = ParseHead(args[i])
    if args != []:
        result.args = args
    '''
    return result

def ParseArgs(args):
    result = []
    start = 0
    flag = False
    count = 0
    for i in range(len(args)):
        if (args[i] == '('):
            count += 1
        if (args[i] == ')'):
            count -= 1
            if count == 0:
                flag = True

        if flag:
            result.append(args[start:i+1])
            start = i + 1
            flag = False

    for i in range(len(result)):
        if result[i].find('(') >= 0:
            result[i] = result[i].lstrip()
            result[i] = result[i].lstrip(',')
            result[i] = result[i].lstrip()
            result[i] = ParseHead(result[i])

    return result

def ParseBody(body):
    if body == "":
        return None
    result = []
    data = body.split(',')
    predicates = []
    for i in range(len(data)):
        temp = data[i]
        if temp.count(')') > temp.count('('):
            temp = data[i - 1] + "," + data[i]
        if temp.count(')') == temp.count('('):
            predicates.append(temp)
    for predicate in predicates:
        #Loai bo khoang trang du thua
        predicate = predicate.lstrip()
        predicate = predicate.rstrip()
        #
        result.append(ParseHead(predicate))
    return result

def LoadKb(input):
    ifile = open(input, "r")
    kb = []
    for line in ifile:
        line = line.rstrip('\n')
        line = line.rstrip()
        line = line.lstrip()
        if line != "":
            kb.append(ParseClause(line))
    return kb


if __name__ == "__main__":
    kb = LoadKb("input.txt")
    print(kb)