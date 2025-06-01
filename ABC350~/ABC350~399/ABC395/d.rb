n,q = gets.split.map(&:to_i)
pigeon = Hash.new(n)
nest = Hash.new(){|h,k| h[k]={}}
ans = []
(1..n).each do |i|
  pigeon[i]=i
  nest[i][i]=i
end
q.times do
  input = gets.split.map(&:to_i)
  case input[0]
  when 1
    pigeon[input[1]] = input[2]
    nest[input[2]].merge!(nest[input[1]])
    nest[input[1]].delete(input[1])
  when 2
    nest[input[1]] , nest[input[2]] = nest[input[2]], nest[input[1]]
  else
    ans << nest[pigeon[input[1]]]
  end
end
puts "pigeon:#{pigeon.inspect}"
puts "nest:#{nest.inspect}"
puts ans.inspect