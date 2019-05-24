# Ruby fixed size queue implementation
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
  FULL_QUEUE = "Queue is full"

  # @param Integer (optional) size
  def initialize(max_size = nil)
    @head = nil
    @tail = nil
    @max_size = max_size
    @size = 0
  end

  def enqueue(val)
    if @size == @max_size
      puts FULL_QUEUE
      return
    end
    x = Node.new(val, nil)
    unless @tail.nil?
      @tail.nextNode = x
    end
    @tail = x
    if empty?
      @head = x
    end

    # increment used space of Queue
    unless @max_size.nil?
      @size = @size + 1
    end
  end

  def dequeue
    if empty?
      printEmptyError(__method__)
      return
    end
    temp = @head
    @head = temp.nextNode

    # decrement used space of Queue
    unless @max_size.nil?
      @size = @size - 1
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

  # can't use size, since it's an optional param
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

puts "> Queue with specified max size of 2"
q2 = Queue.new(2)
q2.enqueue('a')
q2.enqueue('b')
q2.enqueue('c') # expected error
