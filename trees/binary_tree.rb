# Ruby Binary Tree implementation
# Node class to represent each item
# not balanced, no duplicates

class Node
  attr_accessor :val, :left, :right

  def initialize(val, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

class BinaryTree

  EMPTY_TREE = "Binary Tree is empty"
  DUPLICATE_VAL = "This value exists already"

  def initialize
    @root = nil
  end

  # insert new leaf node
  def insert(value)
    if empty?
      @root = Node.new(value)
      return
    end

    x = Node.new(value)

    # find right leaf to insert under
    temp = @root
    while !temp.nil? do
      # need to track parent so when we exit the loop,
      # we can still reference the leaf node found
      found_leaf = temp

      if temp.val > value
        temp = temp.left
      elsif temp.val < value
        temp = temp.right
      else
        puts DUPLICATE_VAL
        return
      end
    end

    if found_leaf.val > value
      found_leaf.left = x
    else
      found_leaf.right = x
    end
  end

  def search(value)
    if empty?
      puts EMPTY_TREE
      return
    end

    temp = @root
    while !temp.nil? do
      if temp.val > value
        temp = temp.left
      elsif temp.val < value
        temp = temp.right
      else
        puts "true"
        return
      end
    end

    puts "false"
    return
  end

  def remove(value)
    if empty?
      puts EMPTY_TREE
      return
    end
  end

  def empty?
    @root.nil?
  end

  def printBinaryTree
    if empty?
      puts EMPTY_TREE
      return
    end

    printSubTree(@root, 0)
  end

  # based on https://stackoverflow.com/questions/13484943/print-a-binary-tree-in-a-pretty-way
  def printSubTree(node, current_height)
    return if node.nil?

    if current_height > 0
      print ' ' * current_height
    end
    puts node.val

    unless node.left.nil?
      printSubTree(node.left, current_height + 4)
    end

    unless node.right.nil?
      printSubTree(node.right, current_height + 4)
    end
  end
end

# Main
b = BinaryTree.new
b.insert(50)
b.insert(30)
b.insert(80)
b.insert(40)
b.insert(100)
b.insert(110)
b.insert(60)
b.insert(70)
b.search(60)
b.search(30)
b.search(50)
b.printBinaryTree
