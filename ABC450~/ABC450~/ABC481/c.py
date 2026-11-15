q = int(input())
bank = {}
stack = [1]

for i in range(q):
    kabocha = input()
    if kabocha in bank:
        print(bank[kabocha])
    else:
        bank.setdefault(kabocha,stack[-1])
        print(bank[kabocha])
        stack.append(stack[-1]+1)