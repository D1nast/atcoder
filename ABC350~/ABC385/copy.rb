n = gets.to_i
h = gets.split.map(&:to_i)

ans = 0
# w を 1 から n まで試す
(1..n).each do |w|
  # si を 0 から w-1 まで試す
  (0...w).each do |si|
    a = []
    # si から n まで、w ごとに要素を選ぶ
    (si...n).step(w) do |i|
      a << h[i]
    end

    val = -1
    len = 0
    # 最大連続値を求める
    a.each do |x|
      if val == x
        len += 1
      else
        val = x
        len = 1
      end
      ans = [ans, len].max
    end
  end
end

puts ans
