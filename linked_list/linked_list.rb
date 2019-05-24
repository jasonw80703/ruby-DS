# Ruby singly linked list implementation
# Node class to represent each item
# LinkedList class to represent the data structure

class Node
  attr_accessor :val, :nextNode

  def initialize(val, nextNode = nil)
    @val = val
    @nextNode = nextNode
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
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
n1 = Node.new(5)
ll.head = n1
ll.printLinkedList
n2 = Node.new(7)
ll.head.nextNode = n2
ll.printLinkedList
