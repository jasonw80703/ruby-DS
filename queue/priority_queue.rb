# Ruby priority queue implementation
# Node class to represent each item with priority
# Dequeue from the head
# Enqueue based on priority, highest priority at the front
# If two nodes have the same priority, then insert in order

class Node
  attr_reader :val, :priority
  attr_accessor :nextNode

  # @param Integer val
  # @param Integer priority
  # @param Node nextNode
  def initialize(val, priority, nextNode)
    checkParams(val, priority, nextNode)
    @val = val
    @priority = priority
    @nextNode = nextNode
  end

  def checkParams(val, priority, nextNode)
    raise TypeError unless priority.is_a? Integer
    # allow nil for initial creation
    raise TypeError unless nextNode.is_a?(Node) || nextNode.nil?
  end
end

class Queue

  EMPTY_QUEUE = "Queue is empty"

  def initialize
    @head = nil
    @tail = nil
  end

  # linear time to enqueue
  def enqueue(val, priority)
    x = Node.new(val, priority, nil)

    if empty?
      @head = x
      @tail = x
      return
    end

    temp = @head
    prev = nil

    while !temp.nil? do
      # insert in front if greater priority
      if priority > temp.priority
        x.nextNode = temp
        # if inserting at @head
        if prev.nil?
          @head = x
        else # otherwise, new node should be referenced in prev
          prev.nextNode = x
        end
        break
      end
      prev = temp
      temp = temp.nextNode
    end
  end

  def dequeue
    if empty?
      puts EMPTY_QUEUE
      return
    end
    temp = @head
    @head = temp.nextNode
    puts "Dequeued #{temp.val} priority: #{temp.priority}"
  end

  def empty?
    @head.nil?
  end

  def printQueue
    if empty?
      puts EMPTY_QUEUE
      return
    end
    temp = @head
    while !temp.nil? do
      print "|#{temp.val}:#{temp.priority}|"
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
q.dequeue
q.enqueue(5, 1)
q.enqueue(5, 2)
q.enqueue(5, 8)
q.enqueue("nice", 4)
q.enqueue(3, 8)
q.enqueue("blue", 4)
q.dequeue
q.printQueue

