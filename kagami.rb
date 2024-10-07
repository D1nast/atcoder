
n = gets.chomp.to_i

lines = []
n.times{
  line = gets.chomp.to_i
  lines << line
}

puts lines.uniq.length


# 配列にして重複を削除
# array.uniqで重複を削除
# https://atcoder.jp/contests/abs/tasks/abc085_b