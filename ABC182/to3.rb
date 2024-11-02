N = gets.chomp
k = N.length
ans = 100

# N＝1234 k = 4

(0...(1<<k)).each do |num|
  N_tmp = ""
  ans_tmp = 0

  (0...k).each do |shift|
    if (num >> shift) & 1 == 1
      N_tmp += N[shift]
    else
      ans_tmp += 1
    end 
  end

  next if N_tmp.empty?
  
  if N_tmp.to_i % 3 == 0
    ans = [ans,ans_tmp].min
  end
end

if ans == 100
  puts "-1"
else
  puts ans
end
