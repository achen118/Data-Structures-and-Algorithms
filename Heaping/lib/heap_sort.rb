require_relative "heap"

class Array
  def heap_sort!
    if self.sort != self
      self.sort
    end
    len = self.length
    len.times do |idx|
      BinaryMinHeap.heapify_up(self, idx)
    end
    len.times do |idx|
      self[0], self[len - 1 - idx] = self[len - 1 - idx], self[0]
      BinaryMinHeap.heapify_down(self, 0, len - 1 - idx)
    end
    self.reverse!
  end
end
