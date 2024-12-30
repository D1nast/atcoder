def fib(n)
  return 0 if n == 0
  return 1 if n == 1
  return fib(n-1) + fib(n-2)
end

n = gets.to_i
puts fib(n)
# フィボナッチ第n項の数を求める