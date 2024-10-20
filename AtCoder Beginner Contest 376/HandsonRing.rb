n = gets.chomp.split.map(&:to_i)
t = []
n[1].times do
  input = gets.chomp.split
  # 1つ目は文字列、2つ目を整数に変換
  t << [input[0], input[1].to_i]
end

puts "n #{n.inspect}"
puts "t #{t.inspect}"

arr = [*1..n[0]]
l = 1
r = 2
count = 0
t.each do |item|
  if item[0] == "R"
    puts "R線探索 #{item[1] - (arr.index(r)+1)}"
    puts "R逆探索 #{(r-1) + (n[0]-item[1])}"
    normal  = item[1] - (arr.index(r)+1)
    reverse = (r-1) + (n[0]-item[1])
    if normal < reverse && r > l
      count += normal
    else
      count += reverse
    end
    r = item[1]
  else
    normal  = item[1] - (arr.index(l)+1)
    reverse = (l-1) + (n[0]-item[1])
    if normal < reverse && l > r
      count += normal
    else
      count += reverse
    end
    l = item[1]
  end
  # index = 1　順探索:4 - index+1 = 2　逆探索:現在地-左端　+ 末端-行きたいところ (2-1) + (6-4) =3
  # r ~ 指定位置4　の間に Lがあれば逆探索 
end
puts count

# arr = [1,2,3,4,5,6]
# rのインデックスを当てる
# 
#①順の線探索　②逆の線探索　③短い方で、途中で片手を通っていなかったらカウント
#　オーダー　[["R", 4], ["L", 5], ["R", 6]]