class Node
  attr_accessor :data,:next
  def initialize(data)
    @data = data
    @next = nil
  end
end

class Queue
  
  @head = nil
  @tail = nil

  def peekFront()
    return nil if @head == nil
    return @head.data
  end

  def peekBack()
    return peekFront if @tail == nil
    return @tail.data
  end

  def enqueue(data)
    if @head == nil
      @head = Node.new(data)
      @tail = @head
    else
      @tail.next = Node.new(data)
      @tail = @tail.next
    end  
  end
  
  def dequeue()
    return nil if @head == nil
    temp = @head
    @head = @head.next
    @tail = nil if @head == nil
    return temp.data
  end

end

q = Queue.new()
q.enqueue(4)
puts q.peekFront() 
puts q.peekBack() 
q.enqueue(50)
puts q.peekFront() 
puts q.peekBack() 
q.enqueue(64)
puts q.peekFront()
puts q.peekBack() 
puts q.dequeue() 
