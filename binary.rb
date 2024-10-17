class Binary
  attr_accessor :value, :left, :right
  def initialize(value, left = nil, right = nil)
      @value  = value
      @left  = left
      @right  = right
  end

end

def insert(node,value)
  return Binary.new(value) if node.nil?
  if  value < node.value
    node.left = insert(node.left,value)
  else
    node.right = insert(node.right,value)
  end
  node
end

root = nil
values = [10,5,15,3,7,13,18]
values.each do |value|
  root = insert(root,value)
end


insert(10)