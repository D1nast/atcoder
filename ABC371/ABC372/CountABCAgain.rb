N,Q = gets.split.map(&:to_i)
S = gets.chomp.to_s
num = Array.new(Q) {Array.new(2 ,"")}
# 2つのデータを格納する配列をQ個生成

Q.times do |i|
  input = gets.chomp
  arr = input.split
  num[i][0] = arr[0].to_i
  num[i][1] = arr[1].to_s
end

def count_abc(s)
  count = 0
  (0...(S.length-2)).each do |i|
    count += 1 if S[0..i+2] == ["A","B","C"]
  end
end

current_count = count_abc(S)

num.each do |arr|
  index = arr[0] - 1
  new_cahr = arr[1]

  (-2..0).each do |offset|
    if (index + offset).between(0,N - 3)  
      current_count  -= 1 if S[index + offset,3] == ["A","B","C"]
    end
  end
  # 指定したインデックスの文字列を変更するから、前後3文字文を変えなきゃいけない
  # ABCDABCで4文字目(D)をAに変えるなら、BCD,CDA,DABは確認する必要がある
 
  S[index] = new_cahr

  (-2..0).each do |offset|
    if (index + offset).between?(0, N - 3)
      current_count += 1 if S[index + offset, 3] == ["A", "B", "C"]
    end
  end
  puts current_count
end
