require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store, self.capacity = StaticArray.new(8), 8
    self.start_idx, self.length = 0, 0
  end

  # O(1)
  def [](index)
  end

  # O(1)
  def []=(index, val)
  end

  # O(1)
  def pop
  end

  # O(1) ammortized
  def push(val)
  end

  # O(1)
  def shift
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
  end
end
