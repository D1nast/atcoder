n, m = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)

# 動物ごとに見られる動物園の配列を作る
animal_to_zoos = Array.new(m) { [] }

m.times do |i|
  input = gets.split.map(&:to_i)
  k = input[0]
  animal_to_zoos[i] = input[1..k].map { |x| x - 1 } # 0-indexed
end

# 各動物に対して、「最も安い2回分の動物園」を選ぶ
total_cost = 0
m.times do |i|
  zoos = animal_to_zoos[i].map { |zoo| c[zoo] }.sort
  if zoos.size >= 2
    total_cost += zoos[0] + zoos[1]
  else
    # 同じ動物園2回必要
    total_cost += zoos[0] * 2
  end
end

puts total_cost
