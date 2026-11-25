# https://atcoder.jp/contests/abc475/tasks/abc475_d
# 素数判定（エラトステネスの篩）の問題

def get_prime(n):
    sieve = [True] * (n + 1) 
    i = 2
    while i * i <= n: 
        if sieve[i]:
            for j in range(i+i, n + 1, i):
                sieve[j] = False
        i += 1
    return [i for i in range(2, n + 1) if sieve[i]]  

s = input()
dup = [True for _ in range(len(s))] 
equal = []
prime = get_prime(10000000)
s_set = set()
for i in range(len(s)): s_set.add(s[i])

for i in range(len(s)):
    tmp = []
    tmp.append(i)
    # 既に重複済みの値ならスキップ
    if not dup[i]:
        continue
    for j in range(i+1,len(s)):
        # 重複未済かつ、文字が一致
        if dup[j] and s[i]==s[j]:
            tmp.append(j)
            dup[j] = False
    if len(tmp) >=2:
        equal.append(tmp)

for i in range(len(prime)):
    st = str(prime[i])
    st_set = set()
    for j in range(len(st)): st_set.add(st[j])
    # お互い文字の種類数が一緒であること 重複するべき箇所が一致していること 文字数が一緒なこと
    if len(st) != len(s) or len(s_set)!=len(st_set) :
        continue

    skip = False
    for eles in equal:
        tmp = st[eles[0]]
        for ele in eles:
            if tmp != st[ele]:
                skip = True
                break
    if skip:
        continue        

    print(st)
    exit()

# print(st_set,"equal",len(equal),"dup_set","s_set",s_set)
print(-1)