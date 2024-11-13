n, t = gets.split.map(&:to_i)
row = Array.new(n, 0)
col = Array.new(n, 0)
dia1 = 0
dia2 = 0


t.times do |ti|
  a = gets.to_i - 1
  i = a / n
  j = a % n

  # ここでの `add` メソッドは C++ のラムダ式に相当します
  add = lambda do |x|
    x += 1
    if x == n
      puts ti + 1
      exit
    end
  end

  # row, col, dia1, dia2 の各対応するインデックスに対して add メソッドを呼び出す
  add.call(row[i])
  add.call(col[j])
  add.call(dia1) if i == j
  add.call(dia2) if i + j == n - 1
end

puts -1
