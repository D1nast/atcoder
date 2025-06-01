q = gets.to_i
query = []
snake = []
minus = 0
start = 0
q.times do
  query << gets.split.map(&:to_i)
end
# puts "以下回答"
# データ構造 snake = [ [0,1],[頭の位置の座標,蛇の長さ] ]
query.each do |item|
  # クエリの種類に応じた処理
  if item[0] == 1
    if snake.empty?
      snake << [0,item[1]]
    else
      long = snake[-1].sum
      snake << [long,item[1]]
    end
  elsif item[0] == 2
    minus += snake[start][1]
    start += 1
  else
    index = start + item[1] - 1
    puts snake[index][0] - minus
  end
end

# puts snake.inspect