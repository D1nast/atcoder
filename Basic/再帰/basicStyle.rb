def f(n)
  return 1 if n == 1
  return f(n-1) + n
end

n = gets.to_i
puts f(n)

# Nから１までの総和
# O(N)