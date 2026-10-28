

n = int(input())

for _ in range(n):
    s = input()
    str_dict = {}
    arranged = []
    tmp = []
    for i in range(len(s)):
        str_dict.setdefault(s[i],0)
        str_dict[s[i]] += 1
    for i in sorted(str_dict.items(),key = lambda x:x[1],reverse=True):
        arranged.append(list(i))

    if arranged[0][1] > len(s)-arranged[0][1]+1:
        print("No")
        continue

    for i in range(len(arranged)):
        for j in range(arranged[i][1]):
            tmp.append(arranged[i][0])

    out = "".join(tmp)
    front = (len(s)+1)//2
    ans = [""]*len(s)
    ans[0::2] = out[:front]
    ans[1::2] = out[front:]
    
    print("Yes")
    print("".join(ans))


    