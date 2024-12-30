n = gets.to_i
h = [0] + gets.split.map(&:to_i)
max = 1

# スキップする数
(1..n-2).each do |i|
  # スタート位置
  (1..i).each do |start|
    height = 0
    count = 1
    (start..n).step(i) do |j|
      puts j
      if height != h[j]
        count = 1
      else
        count += 1
      end
      height = h[j]
      max = [max,count].max
    end
  end
end

puts max.inspect
# マックス飛ばせる距離は、1+n-2で計算可能
# ChatGPTでC++に変換するとAC。rubyのままだとTLE