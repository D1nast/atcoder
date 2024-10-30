chess = []
count = 0
(1..8).each do |i|
  arr = gets.chomp.chars
  chess << arr
end
# 横軸の修正　横軸で修正した箇所は×に
chess.each do |row|
  (0...8).each do |i|
    # 当該行に#があれば、以下のコードを実行
    if row[i] == "#"
      (0...8).each do |num|
        # 横軸は×マークに
        if row[num] == "."
        # chessの行で＃がついていない部分を全て塗り替え
          row[num] = "x"
        end
      end
    end
  end
end
# 縦軸の修正
chess.each do |row|
  # 一行ずつ確認し、＃があれば縦に＃をかけていく
  (0...8).each do |i|
    # 当該行に#があれば、以下のコードを実行
    if row[i] == "#"
      (0...8).each do |num|
        # chess 1~8行目のi番目を者＃に変更
        chess[num][i] = "#"
      end
    end
  end
end

chess.each do |row|
  (0...8).each do |i|
    count += 1 if row[i] == "."
  end
end

puts count
