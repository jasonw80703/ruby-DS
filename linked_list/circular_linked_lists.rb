class Node
	attr_accessor :val, :next

	def initialize(val)
		@val = val
		@next = nil
	end
end

class CircularLinkedList
  attr_accessor :size, :head

  def initialize
  	@size = 0
  	@head = nil
  end

  # push to start of list
	def push(node)
		if @size.zero?
			@head = node
			@size += 1
			return
		end

		temp = @head
		node.next = @head

		if @size == 1
			node.next.next = node
		else
			while temp.next != @head
				temp = temp.next
			end
			temp.next = node
    end
    @head = node
		@size += 1
	end

	# prints array, no do while loop in ruby I think...
  def to_a
    if @size.zero?
      return []
    end
    if @size == 1
      return [@head.val]
    end

    res = [@head.val]
    temp = @head.next
		while !temp.nil? && temp != @head
			res << temp.val
			temp = temp.next
		end
		res
	end
end