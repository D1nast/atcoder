n , m = gets.split.map(&:to_i)
# Ni店の品揃え格納
arr = Array.new (n)

(0...n).each do |i|
 input = gets.chomp.split("")
 arr[i] = input
end


# 全探索用
list = Array.new

# 最大のお店回る数はN
ans = n


# bit演算 2^n回通り探索　左シフト演算
(0...(1 << n)).each do |num|
  puts "num#{num}"
  # 右シフト演算
  (0...n).each do |shift|
    puts "num >> shift shift:#{shift} #{num>>shift}"
    if (num >> shift) & 1 == 1
      list[num]
    end
  end
end


n, m = gets.split.map(&:to_i)
s = []
n.times { s << gets.chomp }

# ビット演算用に配列を作成
b = Array.new(n) { Array.new(m, 0) }

# s[i][j] が 'o' の場合、b[i][j] を 1 にセット
n.times do |i|
  m.times do |j|
    if s[i][j] == 'o'
      b[i][j] = 1
    end
  end
end

# 最小の行数を求めるために全探索
ans = n
(1 << n).times do |x|
  bx = x.to_s(2).rjust(n, '0').chars.map { |c| c == '1' ? 1 : 0 }
  sb = Array.new(m, 0)
  
  # x のビットが 1 の行を選んで、対応する列の状態を sb に反映
  n.times do |i|
    if bx[i] == 1
      m.times do |j|
        sb[j] |= b[i][j]
      end
    end
  end
  
  # sb において '1' の個数が m と等しい場合、最小行数を更新
  if sb.count(1) == m
    ans = [ans, bx.count(1)].min
  end
end

puts ans








# # 配列にポップコーンの品揃えを追加
# (0...n).each do |i|
#   input = gets.chomp.split("")
#   arr[i] = input
# end


# # 全探索する
# (0...n).each do |i|

#   count = 1

#   # もし１売り場目で全てのポップコーンが買える場合
#   if arr[i].uniq.length == 1 
#     puts "breakに該当23"
#     ans = count
#     break
#   end

#   # 重複確認用の配列を作成
#   arr[i].each do |string|
#     list[i] << string
#   end

#   # 選択した配列以外を選択した配列[i]の文字列とチェックの全探索
#   (0...n).each do |j|
#     next if i == j
#     count += 1
#     arr[j].each_with_index do |string,index|
#       if arr[i][index] != arr[j][index] && arr[i][index]=="x"
#         arr[i][index]="o"
#       end
#     end
#     puts arr[i].inspect
#     break if arr[i].uniq.length == 1
#   end

#   ans = [ans,count].min

# end

# puts ans