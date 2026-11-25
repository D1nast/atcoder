s = "s"+input()
dp = [[0]*2 for _ in range(3)]

for i in range(1,len(s)):
    if s[i]=="a":
        plus = 0
    elif s[i]=="b":
        plus = 1
    else:
        plus = 2

    # 該当の文字の箇所だけ変更
    dp[plus][1] = dp[0][0]+dp[1][0]+dp[2][0]+1
    dp[plus][0] = dp[plus][1]

    # 変更を反映（文字数分配列を作るとMLEになった）
    for j in range(3): dp[j][1]=0

print(sum(dp[j][0] for j in range(3))%998244353)