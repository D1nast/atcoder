# class BinaryTree
#   attr_accessor :data, :left, :right
#   def initialize(data, left = nil, right = nil)
#       @data  = data
#       @left  = left
#       @right  = right
#   end
# end

# def toBinaryTree(root)
#   rootTree  = BinaryTree.new(root[0])
#   i = 1
#   root.each do |item|
#       node = BinaryTree.new(item)
#       if i % 2 != 0
#           temp = node
#           rootTree.left = node
#           rootTree = temp
#       else
#           temp = node
#           rootTree.right = node
#           rootTree = temp
#       end
#   end
# end

# def bstSearch(root,key)
#   # 関数を完成させてください

# end

class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @data = data
    @left = nil
    @right = nil
  end
end

class BinaryTree

  def initialize
    @root = nil
  end

  def insert(value)
    @root = insert_recursively(@root, value)
  end

  def insert_recursively(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      node.left = insert_recursively(node.left, value)
    else
      node.right = insert_recursively(node.right, value)
    end

    node
  end

  def bst_search(node, key)
    return nil if node.nil?

    if key == node.value
      node
    elsif key < node.value
      bst_search(node.left, key)
    else
      bst_search(node.right, key)
    end
  end

  def search(key)
    bst_search(@root, key)
  end
end

# 二分探索木を作成
bst = BinaryTree.new
bst.insert(0)
bst.insert(-10)
bst.insert(5)
bst.insert(-3)
bst.insert(9)

# 探索
result_node = bst.search(5)

# 結果を表示
if result_node
  puts "[#{result_node.value}, #{result_node.left ? result_node.left.value : 'null'}, #{result_node.right ? result_node.right.value : 'null'}]"
else
  puts "null"
end
