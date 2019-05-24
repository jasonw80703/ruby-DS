# Ruby doubly linked list implementation
# Node class to represent each item
# LinkedList class to represent the data structure

class Node
  attr_accessor :val, :nextNode, :prevNode

  def initialize(val, prevNode = nil, nextNode = nil)
    @val = val
    @prevNode = prevNode
    @nextNode = nextNode
  end
end

# Notes:
# => head node should have nil prevNode
# => tail node should have nil nextNode
class LinkedList

  EMPTY_LINKED_LIST = "LinkedList if empty"
  NODE_NOT_FOUND = "Cannot find node with provided value"

  def initialize
    @head = nil
    @tail = nil
  end

  # insertion methods
  def insert_at_head(val)
    x = Node.new(val)
    if empty?
      @head = x
      @tail = x
    else
      temp = @head
      @head = x
      x.nextNode = temp
      temp.prevNode = x
    end
  end

  # insert after the first node with the provided node_val
  # @param Any val (new value to add)
  # @param Any node_val (add value after this node)
  # Example: 5 6, insert_after_node(3, 5)
  # 3 n=>nil p=>nil, after: n=>6 p=> 5
  # 5 n=>6 p=>nil, after: n=>3 p=>nil
  # 6 n=>nil p=>5, after: n=>nil p=>3
  def insert_after_node(val, node_val)
    if empty?
      puts EMPTY_LINKED_LIST
      return
    end
    x = Node.new(val)
    temp = @head
    while !temp.nil? do
      if temp.val == node_val
        temp.nextNode.prevNode = x
        x.nextNode = temp.nextNode
        temp.nextNode = x
        x.prevNode = temp
        return
      end
      temp = temp.nextNode
    end
    # can't find node_val
    puts NODE_NOT_FOUND
  end

  # insert before the first node with the provided node_val
  # @param Any val (new value to add)
  # @param Any node_val (add value before this node)
  # Example: 5 6, insert_before_node(3, 6)
  # 3 n=>nil p=>nil, after: n=>6 p=> 5
  # 5 n=>6 p=>nil, after: n=>3 p=>nil
  # 6 n=>nil p=>5, after: n=>nil p=>3
  def insert_before_node(val, node_val)
    if empty?
      puts EMPTY_LINKED_LIST
      return
    end
    x = Node.new(val)
    temp = @head
    while !temp.nil? do
      if temp.val == node_val
        temp.prevNode.nextNode = x
        x.prevNode = temp.prevNode
        temp.prevNode = x
        x.nextNode = temp
        return
      end
      temp = temp.nextNode
    end
    # can't find node_val
    puts NODE_NOT_FOUND
  end

  def insert_at_tail(val)
    x = Node.new(val)
    if empty?
      @head = x
      @tail = x
    else
      @tail.nextNode = x
      x.prevNode = @tail
      @tail = x
    end
  end

  def empty?
    @head.nil?
  end

  def head
    puts "Head value: #{@head.val}"
    puts "Head nextNode value: #{@head.nextNode.val}"
  end

  def tail
    puts "Tail value: #{@tail.val}"
    puts "Tail prevNode value: #{@tail.prevNode.val}"
  end

  def printLinkedList
    temp = @head
    while !temp.nil? do
      print "|#{temp.val}|"
      temp = temp.nextNode
      unless temp.nil?
        print "|-|->"
      end
    end
    print "|x|"
    puts "\n"
  end
end

# Main
ll = LinkedList.new
ll.insert_at_head(5)
ll.insert_at_head(3)
ll.insert_at_tail(2)
ll.head
puts "--------"
ll.tail
ll.insert_after_node(7, 5)
ll.insert_before_node('b', 7)
ll.printLinkedList
