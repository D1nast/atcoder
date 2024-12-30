k = gets.to_i
s,t = gets.chomp.chars ,gets.chomp.chars
slen,tlen = s.length,t.length
len = [slen,tlen].max
count,nilc = 0 , 0
insert,delete = s.dup ,s.dup

(0...len).each do |i|
  if s[i].nil? || t[i].nil?
    nilc += 1
  elsif s[i] != t[i]
    count += 1
  end
end
(0...len).each do |i|
  if s[i] != t[i]
    # 文字数がS<Tの時は削除のみ
    if slen - tlen < 0
      insert.insert(i,t[i])     
    else
    # 文字数がS>Tの時は削除のみ
      delete.slice!(i)
    end   
    break
  end
end

if (count <= k && nilc <= k) || insert == t || delete == t
  puts "Yes"
else
  puts "No"
end

# puts s.inspect,t.inspect
# puts insert.inspect,delete.inspect
# puts "count:#{count} nilc:#{nilc}"