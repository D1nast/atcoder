n = gets.to_i
memo = Hash.new()

def function(x,memo)
  return 0 if x == 1
  return memo[x] if memo.key?(x)

  res = function( x/2, memo ) + function( x-x/2 , memo ) + x

  memo[x] = res
  return res
end

puts function(n,memo)
