def fib(n,memo)
  return 0 if n == 0
  return 1 if n == 1
  return memo[n] if memo.key?(n)

  memo[n] = fib(n-1,memo) + fib(n-2,memo)
  return memo[n]
end
n = gets.to_i
memo = {}
puts fib(n,memo)