n,d,p = gets.split.map(&:to_i)
f =  gets.split.map {|num| num.to_i * -1 }
f.sort!
sum = f.sum
min = [sum,-(n/d+1)*p].max

(0...n/d*d).each do |i|
  sum = sum - f[i] 
  if (i+1) % d == 0
    ticketP = (i+1)/d * p
    min = [min,sum-ticketP].max
  end
end

puts min.abs




# nまで周遊パスを購入した場合と、購入しなかった場合とで全探索
# 組み合わせの関数が大幅なTLEになる