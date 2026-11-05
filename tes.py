

n = int(input())
card = []
ans = []
for i in range(n):
    get = list(map(int,input().split()))
    card.append([get[0],get[1],i+1])

sorted_card = sorted(card,key=lambda x: [x[0],x[1]],reverse=True)

for i in range(len(sorted_card)):
    if i == 0:
        tmp = sorted_card[i]
        ans.append(sorted_card[i][2])
    else:
        # コストが大きいなら捨てる
        if sorted_card[i][1]<tmp[1]:
            ans.append(sorted_card[i][2])
            tmp = sorted_card[i]

ans.sort()
print(len(ans))
print(" ".join(map(str,ans)))
    

# パワー順
# コストが高い順