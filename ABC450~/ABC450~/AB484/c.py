import copy

n = int(input())
ai = list(map(int,input().split()))
bi = list(map(int,input().split()))
tmp = -1
nst=-1
def check(num):
    tmp =-1
    nst = -1
    a = ai[:]
    b = bi[:]
    for i in range(n):
        if a[i]!=b[i]:
            # 範囲外ならNo
            if i+1 < n:
                # いずれかの隣と一致しない場合もNo
                if a[i+1]==b[i] and num == 1:
                    tmp = a.pop(i)
                    a.append(-1)
                    nst = i
                    break
                elif b[i+1] == a[i] and num ==2:
                    tmp = b.pop(i)
                    b.append(-1)
                    nst = i
                    break
                else:
                    return False
            else:
                return False

    wa = 1
    for i in range(nst,n):
        if a[i] != b[i]:
            if wa ==1:
                wa += 1
                if b[i]==tmp and a[-1]==-1:
                    a.insert(i,tmp)
                    a.pop()
                elif a[i]==tmp and b[-1]==-1:
                    b.insert(i,tmp)
                    b.pop()
                else:
                    return False

            else:
                return False
    return True

for i in [1,2]:
    count1 = check(1)
    count2 = check(2)

print("Yes" if count1 or count2 else "No")
