N = gets.to_i
A = gets.split.map(&:to_i)
M = gets.to_i
B = gets.split.map(&:to_i)
L = gets.to_i
C = gets.split.map(&:to_i)
Q = gets.to_i
X = gets.split.map(&:to_i)
hash = Hash.new(0)

A.each do |ai|
  B.each do |bi|
    C.each_with_index do |ci|
      hash[ai+bi+ci] = 1
    end
  end
end

X.each do |query|
  if hash[query] == 1
    puts "Yes"
  else
    puts "No"
  end
end