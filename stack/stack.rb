# Ruby stack implementation
# Node class to represent each item
# Stack class to represent the actual LIFO data structure

class Node
  attr_accessor :val, :nextNode

  def initialize(val, nextNode)
    @val = val
    @nextNode = nextNode
  end
end

class Stack

  EMPTY_STACK = "Stack is empty"

  def initialize
    @head = nil
  end

  def push(val)
    x = Node.new(val, @head)
    @head = x
  end

  def top
    if empty?
      printEmptyError(__method__)
      return
    end
    puts "Top of stack: #{@head.val}"
  end

  def pop
    if empty?
      printEmptyError(__method__)
      return
    end
    temp = @head
    @head = temp.nextNode
    puts "Popped off stack: #{temp.val}"
  end

  # single loop, linear runtime
  def contains(check)
    if empty?
      printEmptyError(__method__)
      return
    end
    temp = @head
    while !temp.nil? do
      if temp.val == check
        puts "#{check}: true"
        return
      end
      temp = temp.nextNode
    end
    puts "#{check}: false"
  end

  def empty?
    @head.nil?
  end

  def printEmptyError(methodName)
    puts "#{methodName}: #{EMPTY_STACK}"
  end

  # Example: 5
  #          |
  #          v
  #          6
  #          |
  #          v
  #          9
  # 5 is the head
  def printStack
    if empty?
      printEmptyError(__method__)
      return
    end

    temp = @head
    while !temp.nil? do
      puts "#{temp.val}"
      temp = temp.nextNode
      unless temp.nil?
        puts "|"
        puts "v"
      end
    end
    puts "\n"
  end
end

# Main
s = Stack.new
s.pop
s.push(5)
s.push(6)
s.printStack
s.contains(6)
s.contains(5)
s.contains(4)
s.top
s.pop
s.printStack
s.pop
s.printStack
