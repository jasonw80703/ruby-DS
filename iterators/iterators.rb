# Ruby iterators
# Integer.times
class Integer
  def ttimes
    curr = 0
    until curr == self
      yield curr
      curr += 1
    end
    self
  end
end

# Array.each
class Array
  # @return self
  def eeach
    curr = 0
    until curr == self.size
      yield self[curr]
      curr += 1
    end
    self
  end

  # @return new array
  def mmap
    acc = []
    eeach { |element| acc << yield element }
    acc
  end
end