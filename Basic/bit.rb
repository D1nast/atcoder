# 入力の受け取り
N = gets.chomp

# Nの桁数
d = N.length

# 答え
ans = 100

# num=(000...0)~(111...1)
(0...(1 << d)).each do |num|
  # 桁を消して作れる数字
  N_tmp = ""
  # 消した個数
  ans_tmp = 0

  # shift=0~(d-1)
  (0...d).each do |shift|
    # 1 & (numをshift個右シフト)=1ならば
    if (num >> shift) & 1 == 1
      # その桁を使う
      N_tmp += N[shift]
    else
      # 桁を消した個数をカウント
      ans_tmp += 1
    end
  end

  # N_tmpが空なら
  # ⇔num=(000...0)の場合
  if N_tmp.empty?
    # 次のnumへ
    next
  end

  # 整数にして3で割り切れる場合
  if N_tmp.to_i % 3 == 0
    # ansよりans_tmpが小さければ更新
    ans = [ans, ans_tmp].min
  end
end

# 答えが更新されていなければ
if ans == 100
  # 「-1」を出力⇔3の倍数は作れない
  puts -1
else
  # 答えを出力
  puts ans
end