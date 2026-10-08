# https://atcoder.jp/contests/abc375/tasks/abc375_d
# i<j<k jを2~n-1まで試す

s = input()
head = {}
tail = {}
ans = 0

# 英大文字の辞書を作成できる
# chr(i+95)で英小文字
# Unicode順
for i in range(26):
    head.setdefault(chr(i+65),0)
    tail.setdefault(chr(i+65),0)

head[s[0]] += 1
for i in range(2,len(s)):
    tail[s[i]]+=1

for i in range(1,len(s)):
    if i ==1:
        for str,num in head.items():
            ans += num*tail[str]
    elif i == len(s)-1:
        break
    else:
        head[s[i-1]]+=1
        tail[s[i]]-=1
        for str,num in head.items():
            ans += num*tail[str]

print(ans)