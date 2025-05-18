q = gets.to_i
queue = []
now = 0

q.times do
  inputs = gets.split.map(&:to_i)
  type = inputs[0]

  case type
  when 1
    queue << now
  when 2
    t = inputs[1]
    now += t
  when 3
    h = inputs[1]
    ans = 0
    while !queue.empty? && now - queue.first >= h
      ans += 1
      queue.shift
    end
    puts ans
  end
end
