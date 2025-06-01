require 'set'
n,r,c = gets.split.map(&:to_i)
s = gets.chomp.chars
set = Set.new()
takahashi = [r,c]
smoke = [0,0]
set.add(smoke.dup)
ans = []
(0...n).each do |i|
  case s[i]
  when "N"
    takahashi[0] += 1
    smoke[0] += 1
  when "E"
    takahashi[1] -= 1
    smoke[1] -= 1
  when "W"
    takahashi[1] += 1
    smoke[1] += 1
  else
    takahashi[0] -= 1
    smoke[0] -= 1
  end
  # puts "takahashi:#{takahashi.inspect} smoke:#{smoke.inspect} "
  set.add(smoke.dup)
  if set.include?(takahashi)
    ans<< 1
  else
    ans << 0
  end
end

puts ans.join("")
# puts set.inspect