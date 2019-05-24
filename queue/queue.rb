# Ruby queue implementation
# Node class to represent each item
# Queue class to represent the actual FIFO data structure

class Node
  attr_accessor :val, :nextNode

  def initialize(val, nextNode)
    @val = val
    @nextNode = nextNode
  end
end

class Queue

  EMPTY_QUEUE = "Queue is empty"

  def initialize
    @head = nil
    @tail = nil
  end

  def reset
    @head = nil
    @tail = nil
  end

  def enqueue(val)
    x = Node.new(val, nil)
    unless @tail.nil?
      @tail.nextNode = x
    end
    @tail = x
    if empty?
      @head = x
    end
  end

  def dequeue
    if empty?
      printEmptyError(__method__)
      return
    end

    temp = @head
    if @head == @tail
      reset
    else
      @head = temp.nextNode
    end
    puts temp.val
  end

  def head
    if empty?
      printEmptyError(__method__)
      return
    end
    puts "Head of queue: #{@head.val}"
  end

  def tail
    if empty?
      printEmptyError(__method__)
      return
    end
    puts "Tail of queue: #{@tail.val}"
  end

  def empty?
    @head.nil?
  end

  def printEmptyError(methodName)
    puts "#{methodName}: #{EMPTY_QUEUE}"
  end

  # Example: 5 -> 6 -> 8
  # 5 is the head
  # 8 is the tail
  def printQueue
    if empty?
      printEmptyError(__method__)
      return
    end
    temp = @head
    while !temp.nil? do
      print "|#{temp.val}|"
      temp = temp.nextNode
      unless temp.nil?
        print " -> "
      end
    end
    puts "\n"
  end
end

# Main
q = Queue.new
q.enqueue(1)
q.enqueue(2)
q.head
q.tail
q.printQueue
q.dequeue
q.dequeue
puts q.empty?
q.enqueue(5)
q.enqueue(3)
q.printQueue
q.dequeue
q.printQueue
