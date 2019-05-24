# Ruby stack implementation
# Use array to house stack elements

class Stack

  EMPTY_STACK = "Stack is empty"
  
  def initialize
    @arr = []
  end

  def push(val)
    @arr << val
  end

  def pop
    if empty?
      puts EMPTY_STACK
      return
    end
    @arr.pop
  end

  def top
    if empty?
      puts EMPTY_STACK
      return
    end
    @arr.last
  end

  def empty?
    @arr.empty?
  end

  def contains(val)
    @arr.include? val
  end

  def printStack
    if empty?
      puts EMPTY_STACK
      return
    end

    @arr.reverse.each_with_index do |item, index|
      puts item
      unless index == @arr.length - 1
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
