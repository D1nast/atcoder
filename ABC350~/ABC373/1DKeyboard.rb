S = gets.chomp.chars
count = 0
current_index = S.index("A")
# 26文字あるので、インデックスは0~25まで
list = ["B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

list.each_with_index do |char,index|
    #　次の文字のインデックスを格納 
    next_index = S.index(char)
    # 前の文字のインデックスと次の文字のインデックスの差を計算。移動数がわかる
    count += (current_index - next_index).abs
    current_index = next_index
end

puts count
