def fib(n)
  return n if n<=1

  fib = Array.new(n+1)
  fib[0] = 0
  fib[1] = 1
  
  (2..n).each do |i|
    fib[i] = fib[i-1] + fib[i-2]
    puts "フィボナッチ#{i}項は#{fib[i]}です"
  end

  return fib[n]
end

puts fib(17)