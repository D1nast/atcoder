n = gets.to_i
a = gets.chomp.split.map(&:to_i).sort
b =  gets.chomp.split.map(&:to_i).sort

# puts a.inspect
# puts b.inspect

i = 0
purchase = []
while i < n do
  # puts "#{i+1}回目の処理実行中"
  if a[a.size-1] <= b[b.size-1]
  # aの末尾とbの末尾 a=3 b=2
    a.delete_at(a.size-1)
    b.delete_at(b.size-1)
  #　aとbの末尾の削除
  else
    purchase << a[a.size-1]
    # Ai ≤ Biでなかった場合、おもちゃの箱を買う。箱の大きさはAi
    a.delete_at(a.size-1)
    # 購入した箱分の要素を削除
  end
  i += 1
end 

if purchase.size < 2
  puts purchase[0]
else
  puts "-1"
end