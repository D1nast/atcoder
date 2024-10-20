divide = ["dream", "dreamer", "erase", "eraser"]

# 入力の取得
S = gets.chomp

# 文字列を反転
S.reverse!
divide.map!(&:reverse)

puts S.inspect
puts divide.inspect

# 端から切っていく
can = true
i = 0

while i < S.length
  can2 = false # 4個の文字列のどれかでdivideできるか
  divide.each do |d|
    if S[i, d.length] == d # dでdivideできるか
      can2 = true
      i += d.length # divideできたらiを進める
      break # 一つ見つけたら他の単語を調べる必要はない
    end
  end
  
  if !can2 # divideできなかったら
    can = false
    break
  end
end

if can
  puts "YES"
else
  puts "NO"
end

