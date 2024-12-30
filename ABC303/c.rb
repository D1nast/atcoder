# n:移動回数　m:アイテムの個数 h:体力初期値 k:体力がk未満ならアイテム消費し、体力はkになる
n,m,h,k = gets.split.map(&:to_i)
s = gets.chomp
item = Hash.new{ |hash,key| item[key] = 0 }
init = [0,0]
# アイテムの座標を設定
m.times do
  x,y = gets.split.map(&:to_i)
  item[[x,y]] += 1
end
# n回移動する
(0...n).each do |i|
  h -= 1
  case s[i]
  when "R" then
    init[0] += 1
  when "L" then
    init[0] -= 1
  when "U" then
    init[1] += 1
  when "D" then
    init[1] -= 1
  end
  # 移動後体力が０なら即終了
  if h < 0
    puts "No"
    exit
  end 
  # h<kかつその座標にアイテムがあれば使用
  if h < k && item[init] > 0
    item[init] -= 1
    h = k
  end
end

puts "Yes"