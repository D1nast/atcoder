class SinglyLinkedListNode
  attr_accessor :data, :next
  def initialize(data)
      @data  = data;
      @next  = nil;
  end
end

def singlyLinkedList(list)
  head = SinglyLinkedListNode.new(list[0])
  current = head
  list[1..-1].each do |list|
      new_node = SinglyLinkedListNode.new(list)
      current.next = new_node
      puts new_node
      current = new_node
  end
  return head
end

def linkedListLength(head)
  # 関数を完成させてください
  return head
  
end


linkedListLength(singlyLinkedList([3,2,1,5,6,4]))