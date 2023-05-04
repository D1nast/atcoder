a= gets.chomp
b = gets.chomp

if a.match(/^\d{1}$/) && b.match(/^\d{1}$/)
    numA=a.to_i
    numB=b.to_i
    ans=numA*numB
    puts "計算結果は#{ans}です"
else
    puts -1
end

# 正規表現　＾が先頭の文字
# \dは0~9の数字　{}は繰り返される回数
# ＄は文字列の末尾/で正規表現の終わり
