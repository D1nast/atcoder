class PriorityQueue
  def initialize
    @heap = []
  end

  def push(value)
    @heap << value
    sift_up(@heap.size - 1)
  end

  def pop
    return nil if @heap.empty?
    result = @heap.first
    @heap[0] = @heap.pop unless @heap.size == 1
    sift_down(0)
    result
  end

  def empty?
    @heap.empty?
  end

  def size
    @heap.size
  end

  private

  def sift_up(index)
    while index > 0
      parent = (index - 1) / 2
      break if @heap[parent][0] <= @heap[index][0]  # コスト `[0]` を比較
      @heap[parent], @heap[index] = @heap[index], @heap[parent]
      index = parent
    end
  end

  def sift_down(index)
    size = @heap.size
    loop do
      left = index * 2 + 1
      right = index * 2 + 2
      smallest = index

      smallest = left if left < size && @heap[left][0] < @heap[smallest][0] # コスト `[0]` で比較
      smallest = right if right < size && @heap[right][0] < @heap[smallest][0] # コスト `[0]` で比較
      break if smallest == index

      @heap[index], @heap[smallest] = @heap[smallest], @heap[index]
      index = smallest
    end
  end
end


n,m = gets.split.map(&:to_i)

nodeWeight = []
nodeList = Array.new(n){[]}
cost = Array.new(n)

(m+1).times do |i|
  input = gets.split.map(&:to_i) 
  if i == 0
    nodeWeight = input
  else
    nodeList[input[0]-1] << [input[1],input[2]]
  end
end

search = PriorityQueue.new
search.push([nodeWeight[0],1])

while !search.empty?
  c,n = search.pop
  next if !cost[n-1].nil?
  cost[n-1] = c
  break if !cost.any?(nil)
  nodeList[n-1].each do |nextNode,nextCost|
    # puts "c:#{c} nextNode:#{nextNode} nextCost:#{nextCost}"
    next if !cost[nextNode].nil?
    search.push([c+nextCost+nodeWeight[nextNode-1] ,nextNode])
  end
end

# nodeList [ノード,コスト]
# pq [コスト,ノード]
# puts "#{nodeList.inspect} #{cost.inspect} #{nodeWeight.inspect}"
# puts search.inspect

puts cost[1..-1].join(" ")