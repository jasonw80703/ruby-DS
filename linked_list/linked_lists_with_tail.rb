class Node
	attr_accessor :val, :next, :prev

	def initialize(val)
		@val = val
		@next = nil
		@prev = nil
	end
end

class LinkedList
	attr_accessor :head, :tail, :size

	def initialize
		clear
	end

	def push_back(node)
		if @size.zero?
			@head = @tail = node
			@size += 1
			return
		end

		@tail.next = node
		node.prev = @tail
		@tail = node
		@size += 1
	end

	def push_front(node)
		if @size.zero?
			@head = @tail = node
			@size += 1
			return
		end

		node.next = @head
		@head.prev = node
		@head = node
		@size += 1
	end

	def push_index(node, index)
		count = 0
		temp = @head
		while count < index
			temp = temp.next
			count += 1
		end
		temp_prev = temp.prev
		node.next = temp
		temp.prev = node
		node.prev = temp_prev
		temp_prev.next = node

		if count == 0
			@head = node
		end

		if count == @size - 1
			@tail = node
		end

		@size += 1
	end

	def pop_back
		if @size.zero?
			puts "Error, LL is empty."
			return
		end

		if @size == 1
			puts "Popping last node"
			@head = @tail = nil
		else
			@tail = @tail.prev
			@tail.next = nil
		end
		@size -= 1
	end

	def pop_front
		if @size.zero?
			puts "Error, LL is empty."
			return
		end

		if @size == 1
			puts "Popping last node"
			@head = @tail = nil
		else
			@head = @head.next
			@head.prev = nil
		end
		@size -= 1
	end

	def to_a
		temp = @head
		res = []
		while !temp.nil?
			res << temp.val
			temp = temp.next
		end
		res
	end

	def clear
		@head = nil
		@tail = nil
		@size = 0
	end

	def contains(val)
		temp = @head
		while !temp.nil?
			return true if temp.val == val
			temp = temp.next
		end
		false
	end
end