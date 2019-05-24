# Ruby queue implementation
# Use array

class Queue

  EMPTY_QUEUE = "Queue is empty"

  def initialize
    @arr = []
  end

  def enqueue(val)
    @arr << val
  end

  def dequeue
    if empty?
      puts EMPTY_QUEUE
      return
    end
    temp = @arr[0]
    (0..@arr.length - 1).each do |i|
      @arr[i] = @arr[i + 1]
    end
    puts temp
  end

  def head
    if empty?
      puts EMPTY_QUEUE
      return
    end
    puts "Head of queue: #{@arr[0]}"
  end

  def tail
    if empty?
      puts EMPTY_QUEUE
      return
    end
    puts "Tail of queue: #{@arr[@arr.length - 1]}"
  end

  def empty?
    @arr.empty?
  end

  def printQueue
    if empty?
      puts EMPTY_QUEUE
      return
    end
    @arr.each_with_index do |item, index|
      print "|#{item}|"
      unless index == @arr.length - 1
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
