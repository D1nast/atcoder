n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

if a.sum <= m
  puts "infinite"
  exit
end

ok = 0
ng = 1_000_000_001

while (ng - ok) >1
  mid = (ng+ok)/2
  tmp = a.map{|v| [v,mid].min}.sum
  if tmp <= m
    ok = mid
  else
    ng = mid
  end
end

puts ok

# 二分探索問題
# 明確にここから分かれるという場合は二分探索を使うのが良い