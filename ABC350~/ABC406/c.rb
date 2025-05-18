require 'set'
N = gets.to_i
P = gets.split.map(&:to_i)
h_set = Hash.new()
l_set = Hash.new()

(1...P.size-1).each do |i|
  h_set[P[i]] = i if P[i-1] < P[i] && P[i] > P[i+1]
  l_set[P[i]] = i if P[i-1] > P[i] && P[i] < P[i+1]
end

(1...P.size-3).each do |i|
    
end