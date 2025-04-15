require 'set'
def recursion(num,n,m,tmp,ans)
  # ベースケース
  if n == tmp.size
    ans.add(tmp)
    return
  end
  (num+10..m).each do |i|
    list = tmp.dup
    list << i
    if (n - list.size)*10 + i > m
      break
    else
      recursion(i,n,m,list,ans)
    end
  end
end

n,m = gets.split.map(&:to_i)
ans = Set.new
(1..m).each do |i|
  list = [i]
  recursion(i,n,m,list,ans)
end

puts ans.size
ans.sort.each do |item|
  puts item.join(" ")
end