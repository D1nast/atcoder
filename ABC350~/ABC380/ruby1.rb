n = gets.chomp.split("").map(&:to_i)
count1 = 0
count2 = 0
count3= 0

n.each do |num|
  if num > 3
    puts "No"
    exit
  end
  if num == 1
    count1 +=1
  end
  if num ==2
    count2+=1
  end
  if num ==3
    count3+=1
  end
end

if count1 ==1 && count2 ==2 && count3==3
  puts "Yes"
else
  puts "No"
end