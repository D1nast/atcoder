N = gets.to_i
A = gets.split.map(&:to_i)

sum = 0

(0...N).each do |i|
  # 初項がマイナスだった場合
  if i == 0
    if A[i] >= 0
      sum += A[i]
    else
      sum = 0
    end
  else
    sum += A[i]
    sum = 0 if sum < 0
  end
end

puts sum