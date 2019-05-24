# Ruby circular queue implementation
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

  def reset
    @head = nil
    @tail = nil
    # size will reset in #dequeue
  end

  def enqueue(val)
  	# full queue
    if @size == @max_size
      puts FULL_QUEUE
      return
    end

    x = Node.new(val, nil)

    # if empty, set head to first node
    if empty?
      @head = x
    else
      @tail.nextNode = x
    # if not empty initially, previous tail's nextNode is the new node
    # unless @tail.nil?
    #   @tail.nextNode = x
    end

    # set last node
    @tail = x
    # to make it circular, next node of the tail should be the front always
    @tail.nextNode = @head

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
    # if dequeueing last node, reset
    if @head == @tail
      reset
    else
      @head = temp.nextNode
      # reset the circle
      @tail.nextNode = @head
    end

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
    # cannot use check on when temp is nil since circular
    # instead, check when we hit full circle when temp is head
    loop do
      print "|#{temp.val}|"
      temp = temp.nextNode
      if temp == @head
        break
      else
        print " -> "
      end
    end
    puts "\n"
  end
end

# Main
q = Queue.new(3)
q.printQueue
q.enqueue(1)
q.printQueue
q.enqueue(2)
q.printQueue
q.enqueue(3)
q.printQueue
q.dequeue
q.printQueue