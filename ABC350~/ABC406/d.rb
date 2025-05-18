h,w,n = gets.split.map(&:to_i)
row = Hash.new(){|hash,key| hash[key]= []}
col = Hash.new(){|hash,key| hash[key] = []}
n.times do
  input = gets.split.map(&:to_i)
  row[input[0]] << input[1]
  col[input[1]] << input[0]
end
q = gets.to_i
q.times do
  query = gets.split.map(&:to_i)
  ans = 0
  if query[0] == 1
    if row.key?(query[1])
      row[query[1]].each {|i| ans += 1 if col.key?(i)}
      puts ans
      row.delete(query[1])
    else
      puts ans
    end
  else
    if col.key?(query[1])
      col[query[1]].each {|i| ans += 1 if row.key?(i)}
      puts ans
      col.delete(query[1])
    else
      puts ans
    end
  end
end