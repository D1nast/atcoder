n = 5
a = gets.split.map(&:to_i)

ranking = []

# 1 << n は 2^n なので、s = 1 から 2^n - 1 までループ
(1...(1 << n)).each do |s|
  score = 0
  name = ''
  
  # 各ビットをチェックして部分集合を生成
  (0...n).each do |i|
    if s >> i & 1 == 1
      score += a[i] 
      name += ('A'.ord + i).chr
    end
  end
  
  # スコアが大きい順、同じスコアなら名前の順に並べる
  ranking << [-score, name]
end

# ソートして出力.ソートは何も指定しないと、０要素目でソートされる
ranking.sort.each do |score, name|
  puts name
end
