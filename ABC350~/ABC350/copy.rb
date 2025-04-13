n = gets.to_i
a = [0] + gets.split.map(&:to_i)  # 1-based index にするため、先頭に0を追加

ans = []

(1..n).each do |i|
  while a[i] != i
    j = a[i]
    a[i], a[j] = a[j], a[i]  # スワップ
    ans << [i, j]  # 結果に追加
  end
end

puts ans.size
ans.each { |pair| puts "#{pair[0]} #{pair[1]}" }
