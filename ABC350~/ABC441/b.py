n,m = map(int,input().split())
takahashi = input()
aoki = input()
q = int(input())


for i in range(q):
    t = 0
    a = 0
    word = input()
    for j in range(0,len(word)):

        check = 0
        for ao in range(0,len(aoki)):
            if word[j] != aoki[ao]:
                check += 1
            if check == len(aoki):
                a +=1
        check = 0
        for taka in range(0,len(takahashi)):
            # print("word[j]:",word[j],"word:",word)
            if word[j] != takahashi[taka]:
                check += 1
            if check == len(takahashi):
                t +=1

    if t == a == 0:
        print("Unknown")
    elif t == 0:
        print("Takahashi")
    elif a == 0:
        print("Aoki")
    else:
        print("Unknown")
        # print("t",t,"a",a)
