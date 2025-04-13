n,k = gets.split.map(&:to_i)
s = gets.chomp

# # split
idx = [0] + (1...n).select { |i| s[i-1] != s[i] } + [n]
splited_s = idx.each_cons(2).map { |a, b| s[a...b] }
puts splited_s.inspect

# # swap
if s[0] == '0'
  kth_1_idx = 2 * k - 1
else
  kth_1_idx = 2 * k - 2
end

# # swap the k-th 1-indexed blocks
splited_s[kth_1_idx - 1], splited_s[kth_1_idx] = splited_s[kth_1_idx], splited_s[kth_1_idx - 1]

# # join
t = splited_s.join

puts t
