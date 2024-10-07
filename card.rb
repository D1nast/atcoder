n = gets.chomp.to_i
a = gets.chomp

# 配列を作る
value = a.split(" ").map(&:to_i).sort.reverse

alice = 0
bob = 0

value.map.with_index do |a,index|
  if index == 0 || index.even?
    alice = alice + a
  else
    bob = bob + a
  end 
end

puts alice - bob

# 入力した数字を空白で区切って、
# 配列に入れて高いほうからソートしていけばいいんじゃ？
# 配列を数字の大きい順に並び替えて、交互に枚数を取る
# アリスは０と偶数を、ボブは奇数を取っていく
# 配列の数を数える


# https://atcoder.jp/contests/abs/tasks/abc088_b