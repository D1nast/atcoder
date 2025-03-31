N = gets.to_i
dice = []
ans = 0
hash = Hash.new() { |hash,key| hash[key]=0 } 

N.times do 
  input = gets.split.map(&:to_i)
  hash = Hash.new(){ |hash,key| hash[key] = 0 }
  input.each_with_index do |element,index|
    next if index == 0
    hash[element] += 1
  end
  dice << [input[0],hash]
end

comb = dice.combination(2).to_a
comb.each do |element|
  prob = 0.0
  element[1][1].each do |h|
    if element[0][1].key?(h[0])
      prob += (element[0][1][h[0]].to_f/ element[0][0].to_f) * (h[1].to_f / element[1][0].to_f)
    end
  end
  ans = [ ans,prob ].max 
end

puts ans