# s = gets.chomp
# t = gets.chomp
# list = Array.new(3){[]}

# (0...3).each do |i|
  
#   str = t[i].downcase
  
#   (0...s.length).each_with_index do |j,index|
#     if str == s[j]
#       list[i] << index
#       break
#     end
#   end

#   if list[i].empty? && (i == 0 || i ==1)
#     # puts "1文字目か2文字目で見つかりませんでした"
#     puts "No"
#     exit
#   end
# end

# # puts list.inspect

# if "#{s[list[0][0]].upcase}#{s[list[1][0]].upcase}X" == t
#   # puts "#{s[list[0][0]].upcase}#{s[list[1][0]].upcase}X"
#   puts "Yes"
# elsif !list[2].empty? && list[0][0] < list[1][0] && list[1][0] < list[2][0]
#   # "#{s[list[0][0]].upcase}#{s[list[1][0]].upcase}#{s[list[2][0]].upcase}" == t
#   # puts "#{s[list[0][0]].upcase}#{s[list[1][0]].upcase}#{s[list[2][0]].upcase}"
#   puts "Yes"
# else
#   puts "No"
# end


s = gets.chomp
t = gets.chomp

# tの各文字を小文字に変換
t = t.downcase

# 部分列かどうかを判定する関数
def is_subarray?(s, x)
  xi = 0
  s.each_char do |c|
    if x[xi] == c
      xi += 1
    end
    return true if xi == x.length
  end
  false
end

# 条件1: tがsの部分列かをチェック
if is_subarray?(s, t)
  puts "Yes"
  exit
end

# 条件2: tが末尾に'X'を持つ場合、'X'を取り除いて再度チェック
if t[-1] == 'x'
  t.chop!  # 'X'を削除
  if is_subarray?(s, t)
    puts "Yes"
    exit
  end
end

# どちらの条件も満たさない場合
puts "No"
