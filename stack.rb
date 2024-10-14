class Item
  attr_accessor :data,:next
  def initialize(data)
    @data = data
    @next = nil
  end
end

class Stack
  attr_accessor :head
  def initialize
    @head = nil
  end

  def push(data)
    temp = @head
    @head = Item.new(data)
    @head.next = temp
  end

  def pop()
    return nil if @head == nil
    temp = @head
    @head = @head.next
    return temp.data
  end

  def peek()
    return nil if @head == nil
    return @head.data  
  end
end


s1 = Stack.new()
s1.push(2)
puts s1.peek()
s1.push(4)
s1.push(3)
s1.push(1)
puts s1.pop()
puts s1.peek()

s2 = Stack.new()
s2.pop()
s2.push(9)
s2.push(8)
puts s2.peek()