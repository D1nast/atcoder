n,s,q = gets.to_i,gets.chomp,gets.to_i
hash = Hash.new{|hash,key|hash[key]=[]}
ans = Array.new(n){""}
(0...n).each do |i|
  hash[s[i]] << i
end
q.times do
  c,d = gets.chomp.split
  next if c == d
  if hash.has_key?(c)
    if hash.has_key?(d)
      # puts "c:#{c} d:#{d}"
      hash[c].each {|index| hash[d] << index }
      hash.delete(c)
    else
      hash[d] = hash.delete(c)
    end
  end
end
hash.each do |key,value|
  value.each {|num| ans[num] = key}
end
# puts hash.inspect
puts ans.join("")

# 書き換えする文字が同じなら処理しない
# キーが存在するなら書き換え
#  書き換え先がないならそのままキーとインデックスを移植
#  書き換え先が既にあるならキーはそのままに、インデックスを追加
# 存在しないなら処理しない


