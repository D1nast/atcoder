class SinglyLinkedListNode
  attr_accessor :data, :next
  def initialize(data)
      @data  = data;
      @next  = nil;
  end
end

def deleteTail(head)
  # 関数を完成させてください
  return nil if head.nil?
  return nil if head.next.nil?
  current = head
  while current.next.next do
      current = current.next
  end
  current.next = nil
  return head
end

def singlyLinkedList(data)
  head = SinglyLinkedListNode.new(data[0])
  current = head
  data[1..-1].each do |list|
      new_node = SinglyLinkedListNode.new(list)
      current.next = new_node
      current = new_node
  end
  return head
end


# 片方向リストの末尾を削除する