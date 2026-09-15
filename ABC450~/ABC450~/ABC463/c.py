from sortedcontainers import SortedList


event = [] # 時系列
st = SortedList() # 高橋くんの身長の多重集合

n = int(input())
h = [0] * n
l = [0] * n

for i in range(n):
    h[i],l[i] = list(map(int,input().split()))
    st.add(h[i])
    event.append((l[i]*2,0,i))

q = int(input())
t = list(map(int,input().split()))

for i in range(q):
    event.append((t[i]*2+1,1,i))

event.sort()
ans = [0]*q
# print(event)

for obj in event:
    if obj[1]==0:
        st.discard(h[obj[2]])
    else:
        ans[obj[2]] = (st[-1])

print(*ans,sep="\n")


# イベントソート
    # 時系列順で起きたことを纏める

# クエリタイプが0なら削除で、1なら回答