class BinaryTree
  attr_accessor :data, :left, :right

  def initialize(data,left = nil,right = nil)
      @data  = data
      @left  = left
      @right  = right
  end
end

def insert(node,value)

  return BinaryTree.new(value) if node.nil?
  
  if  value < node.data
    node.left = insert(node.left,value)
  else
    node.right = insert(node.right,value)
  end
  return node
end

def toBinaryTree(values)
  node = nil
  values.each do |value|
      next if value.nil?
      node = insert(node,value)
  end
  return node
end

def bstSearch(root,key)
  return nil if root.nil?
  if key == root.data
    return root
  elsif key < root.data
    bstSearch(root.left,key)
  else
    bstSearch(root.right,key)
  end
end

puts  toBinaryTree([0,-10,5,nil,-3,nil,9])

# bstSearch( toBinaryTree([0,-10,5,null,-3,null,9]), 5 )
# [5,null,9]