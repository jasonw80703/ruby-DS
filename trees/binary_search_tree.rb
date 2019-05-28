# Ruby Binary Search Tree implementation
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

class BinarySearchTree

  attr_reader :root

  EMPTY_TREE = "Binary Search Tree is empty"
  DUPLICATE_VAL = "This value exists already"
  MISSING_VAL = "This value does not exist"

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

  # delete node x
  # 1: if x == leaf node, remove
  # 2: if x has one child, child is now where x is, remove x
  # 3: if x has two children, get inorder child
  def remove(value)
    if empty?
      puts EMPTY_TREE
      return
    end

    temp = @root
    parent = nil # track parent of current node visited for node reassignment

    while !temp.nil? do
      if temp.val > value
        if temp.left.nil?
          puts EMPTY_TREE
          break
        end

        parent = temp
        temp = temp.left
      elsif temp.val < value
        if temp.right.nil?
          puts EMPTY_TREE
          break
        end

        parent = temp
        temp = temp.right
      else
        # parent 50, temp 80
        # node found
        # 1: if x == leaf node, remove
        if !temp.left && !temp.right
          if !parent # deleting root node
            @root = nil
          elsif parent.left&.val == temp.val # temp is left child of parent
            parent.left = nil
          else # temp is right child of parent
            parent.right = nil
          end
        # 2: if x has one RIGHT child, child is now where x is, remove x
        elsif !temp.left
          if !parent # deleting root node
            @root = temp.right
          elsif parent.left&.val == temp.val # temp is left child of parent
            parent.left = temp.right # parent's new left node is the right child of temp
          else
            parent.right = temp.right
          end
        # 2: if x has one LEFT child, child is now where x is, remove x
        elsif !temp.right
          if !parent
            @root = temp.left
          elsif parent.left&.val == temp.val
            parent.left = temp.left
          else
            parent.right = temp.left
          end
        # 3: if x has two children, get min inorder value in the right subtree
        else
          successor_value = minInorderNode(temp.right)
          remove(successor_value)
          temp.val = successor_value
        end
        break
      end 
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

  def printTopOfTree
    puts "root: #{@root&.val}"
    puts "left: #{@root.left&.val}"
    puts "right: #{@root.right&.val}"
  end

  private

  # find the minimum value inorder node starting from given node
  def minInorderNode(node)
    temp = node
    while !temp.nil? do
      if temp.left != nil
        temp = temp.left
      else
        break
      end
    end
    temp.val
  end

end

# Main
b = BinarySearchTree.new
b.insert(50)
b.insert(30)
b.insert(80)
b.insert(60)
# b.insert(40)
# b.insert(100)
# b.insert(110)
# b.insert(60)
# b.insert(70)
# b.search(60)
# b.search(30)
# b.search(50)
b.printBinaryTree
# b.remove(30)
# b.printBinaryTree
# b.printTopOfTree
# b.remove(80)
# b.remove(50)
b.remove(50)
b.printBinaryTree
# b.remove(3)
