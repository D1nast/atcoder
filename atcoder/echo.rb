N=gets.chomp.to_i
S=gets.chomp
num=S.length

if N.even? && num.even?
    num=num/2
    T=S.split(/\A(.{#{num}})/,2)

    if T[1]==T[2] && N==num*2
        puts "Yes"
    else
        puts "No"
    end

else
    puts "No"
end
# Nの整数とSの文字数が一致しているかどうか
# Sが最初の文字列を繰り返しているかどうか
# S=T+T
#問題リンク https://atcoder.jp/contests/abc145/tasks/abc145_b


