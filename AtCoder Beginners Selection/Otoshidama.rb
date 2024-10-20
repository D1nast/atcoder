# あらゆる組み合わせを探す全探索問題 計算量がO(N)^3になる
# １秒間につき10^8が計算量マックスの目安　今回Nが最大2000なので、O(N)^3では不可
# O(N)^2で実装
# c= y -total /1000が負にならないように注意


input = gets.chomp.split.map(&:to_i)
n = input[0]
y = input[1]
ans = []

(0..n).each do |a|
  (0..n).each do |b|
      total = 10000*a + 5000*b
      c = (y - total)/1000 
      if c >= 0 && a + b + c == n && total + 1000*c == y
        ans << [a,b,c]
      end
  end
end

if ans[0]
  puts ans[0]
else
  puts "-1 -1 -1"
end



