n,t = gets.split
arr = []
ans = []
(n.to_i).times do
  arr << gets.chomp
end

(0...n.to_i).each do |i|
  # puts "arr[i]:#{arr[i].inspect} #{arr[i].size}"
  diff = 0
  # 文字数が2文字以上異なる場合はスキップ
  next if (t.size - arr[i].size).abs >= 2
  # 文字数が同じ場合、差異が１以下ならカウント
  if t.size == arr[i].size 
    (0...arr[i].size).each do |j|
      diff += 1 if t[j] != arr[i][j]
    end
    ans << i+1 if diff <= 1
  else
    j1 = 0 
    # 文字を挿入する場合
    if t.size > arr[i].size
      (0...t.size).each do |j|
        if t[j] != arr[i][j-j1]
          diff += 1
          j1 += 1
        end
        break if diff >= 2 
      end
      ans << i + 1 if diff == 1
    else
    #　文字を削除する場合 
      (0...arr[i].size).each do |j|
        if t[j-j1] != arr[i][j]
          j1 += 1
          diff += 1
        end
        break if diff >= 2
      end
      ans << i+1 if diff == 1
    end
  end
end

if ans.empty?
  puts 0
  puts ""
else
  puts ans.size
  puts ans.join(" ")
end

# atcoder
# jttcoder