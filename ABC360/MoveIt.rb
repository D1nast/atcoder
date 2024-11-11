n = gets.to_i        # 数値nを入力
a = gets.split.map(&:to_i)  # 配列aを入力
w = gets.split.map(&:to_i)  # 配列wを入力

hash = Hash.new { |hash, key| hash[key] = [] }
count = 0
# ハッシュマップにキーと値を格納
(0...n).each do |i|
  hash[a[i]] << w[i]
end

# ハッシュの値が複数存在する場合、小さい順で処理
hash.each do |key,value|
  if value.size > 1
    value.sort!
    (0...value.size-1).each do |i|
      count += value[i]
    end
  end
end

puts count


# 12
# 3 6 7 4 12 4 8 11 11 1 8 11
# 3925 9785 9752 3587 4013 1117 3937 7045 6437 6208 3391 6309