n,d,p = gets.split.map(&:to_i)
f =  gets.split.map(&:to_i)
min = [f.sum,(n.to_f/d).ceil*p].min

(1..n/d).each do |i|
  except = i * d
  r = n - except
  f.combination(r) {|c| min = [i*p+c.sum,min].min }
end

puts min


# nまで周遊パスを購入した場合と、購入しなかった場合とで全探索
# 組み合わせの関数が大幅なTLEになる