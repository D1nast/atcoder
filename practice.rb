require 'set'
list = Set.new([])
N,M = gets.split.map(&:to_i)

M.times do
  ab = gets.split
  ab[0] = ab[0].to_i
  key = "#{ab[0]}:#{ab[1]}"
  if list.include?(key) || ab[1] == "F"
    puts "No"
  else
    list.add(key)
    puts "Yes"
  end
end