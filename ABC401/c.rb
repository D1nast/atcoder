n, k = gets.split.map(&:to_i)
MOD = 1_000_000_000

arr = Array.new(n + 1, 0)

current_sum = 0
(0...k).each do |i|
  arr[i] = 1
  current_sum += arr[i]
  current_sum %= MOD 
end

(k..n).each do |i|
  arr[i] = current_sum
  current_sum += arr[i]
  current_sum %= MOD  
  current_sum -= arr[i - k]
  current_sum += MOD if current_sum < 0  
end

puts arr[n]

