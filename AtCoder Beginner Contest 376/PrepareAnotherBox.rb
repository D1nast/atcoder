# n = gets.to_i
# a = gets.chomp.split.map(&:to_i).sort
# b =  gets.chomp.split.map(&:to_i).sort

# # puts a.inspect
# # puts b.inspect

# i = 0
# purchase = []
# while i < n do
#   # puts "#{i+1}回目の処理実行中"
#   if a[a.size-1] <= b[b.size-1]
#   # aの末尾とbの末尾 a=3 b=2
#     a.delete_at(a.size-1)
#     b.delete_at(b.size-1)
#   #　aとbの末尾の削除
#   else
#     purchase << a[a.size-1]
#     # Ai ≤ Biでなかった場合、おもちゃの箱を買う。箱の大きさはAi
#     a.delete_at(a.size-1)
#     # 購入した箱分の要素を削除
#   end
#   i += 1
# end 

# if purchase.size < 2
#   puts purchase[0]
# else
#   puts "-1"
# end


n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

a.sort!
b.sort!

(0...(n - 1)).each do |i|
  if a[i] > b[i]
    puts -1
    exit
  end
end

(n - 2).downto(0) do |i|
  if a[i + 1] > b[i]
    puts a[i + 1]
    exit
  end
end

puts a[0]

# 4
# 2 3 5 7
# 2 6 8

# 4
# 3 7 2 5　→ [2,3,5,7]
# 8 1 6　　→ [1,6,8]
# 4
# 3 7 2 5　→ [2,3,5,7]
# 6 2 5　　→ [2,5,6]
#[2,3,5,7]
# [2,4,6]