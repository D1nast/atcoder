class Node
  attr_accessor :value, :left, :right
  
  def initialize(value)
    @value = value  # ここを @data から @value に変更
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
    if node.nil?
      return Node.new(value)  # 新しいノードを返す
    end

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

# 追加の関数: 配列から二分探索木を作成
def toBinaryTree(arr)
  tree = BinaryTree.new
  arr.each { |value| tree.insert(value) unless value.nil? }
  tree
end

# bstSearch 関数の実装
def bstSearch(root, key)
  root.bst_search(root.root, key)  # root から検索
end

# 二分探索木を作成
bst = BinaryTree.new
ins0 = bst.insert(10)
puts ins0
bst.insert(5)
bst.insert(3)
bst.insert(6)

puts ins0.left
