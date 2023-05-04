a= gets.chomp
b = gets.chomp

if a.match(/^\d{1}$/) && b.match(/^\d{1}$/)
    numA=a.to_i
    numB=b.to_i
    ans=numA*numB
    puts "計算結果は#{ans}です"
else
    puts -1
end
