#  N = gets.to_i

# if N == 0
#   puts "#"
#   exit
# elsif N == 1
#   (1..3).each do |i|
#     if i == 1 || i == 3
#       puts "###"
#     else
#       puts "#.#"
#     end
#   end
#   exit
# end

# # グリッド作成用
# center = 3**N / 3
# # 中央のマス以外のグリッド作成用
# Downed_center = (3**(N-1))/3
# count = 0

# (1..(3**N)).each do |row|
#   count += 1
#   # 真ん中のマスのある行かどうか判定
#   if row >= (center + 1) && row <= ( center * 2) 
#     # 中央の行のうち、上段か下段の場合
#     puts "#"*center + "."*center + "#"*center if  row % 3 == 0 || row % 3 == 1
#     # 中央の行のうち、中段の場合
#     puts "#.#"*(center/3) + "."*center + "#.#"*(center/3) if row % 3 == 2
#     count = 0
  
#   # 真ん中以外のブロックの真ん中のマスの行を探索
#   elsif count >= Downed_center + 1 && count <= Downed_center * 2

#     if row % 3 == 0 || row % 3 == 1
#       puts ("#" * Downed_center + "." * Downed_center + "#" * Downed_center)*3

#     elsif row % 3 == 2 && Downed_center/3 == 0
#       puts "#.##.##.#"

#     else
#       puts ("#.#"*(Downed_center/3) + "."*Downed_center + "#.#"*(Downed_center/3))*3 
#     end
#   #　真ん中以外のブロックのうち、真ん中の行でない場合、上段か下段の場合は全て黒
#   elsif row % 3 == 0 || row % 3 == 1
#     puts "#"*3**N
#   #　中央の行でない場合、上段か下段の場合は全て白
#   else
#     puts "#.#"*center
#   end

# end

def main
  n = gets.to_i

  s = ['#']
  puts "s : #{s}"

  n.times do
    m = s.size
    m3 = m * 3
    t = Array.new(m3) { '.' * m3 }  # 3倍サイズの2次元配列を作成
    puts t.inspect
    m3.times do |i|
      m3.times do |j|
        t[i][j] = s[i % m][j % m]
        puts "t#{t[i][j]}"
      end
    end

    m.times do |i|
      m.times do |j|
        t[m + i][m + j] = '.'
      end
    end

    s = t
  end

  s.each { |line| puts line }
end

main
