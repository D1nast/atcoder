n = gets.to_i
a = gets.split.map(&:to_i)
hash = Hash.new() {|hash,key| hash[key]=[]}
min = n+1

# ハッシュの値が複数あるキーは、全探索
# 計算量は3N
(0...n).each do |i|
  hash[a[i]] << i+1
end

hash.each do |h,k|
  if k.size > 1
    prev = 0
    (1...k.size).each do |i|
      min = [ k[i] - k[prev] +1 , min ].min
      prev += 1
    end
  end
end

if min == n+1
  puts -1
else
  puts min
end