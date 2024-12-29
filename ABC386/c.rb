k = gets.to_i
s,t = " " + gets.chomp , " " + gets.chomp
slen,tlen = s.length,t.length
len = [slen,tlen].max
count,nilc = 0 , 0
insert,delete = s.dup ,s.dup

(1...len).each do |i|
  if s[i].nil? || t[i].nil?
    nilc += 1
  elsif s[i] != t[i]
    count += 1
  end
end
(1...len).each do |i|
  if s[i] != t[i]
    insert.insert(i,t[i])
    delete.slice!(i)
    break
  end
end

if count <= k || insert == t || delete == t
  puts "Yes"
else
  puts "No"
end
# puts insert,delete
# puts "count:#{count} nilc:#{nilc}"