class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    pop = @store.pop
    @store = BinaryMinHeap.heapify_down(@store, 0)
    pop
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
    @store = BinaryMinHeap.heapify_up(@store, count - 1)
  end

  public
  def self.child_indices(len, parent_index)
    first_child = 2 * parent_index + 1
    second_child = first_child + 1

    if second_child < len
      return [first_child, second_child]
    elsif first_child < len
      return [first_child]
    else
      return nil
    end

  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    parent = (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    prc = prc.nil? ? Proc.new { |el1, el2| el1 <=> el2 } : prc

    children_idx = self.child_indices(len, parent_idx)

    until children_idx.nil?
      parent = array[parent_idx]
      child_1 = array[ children_idx[0]]
      child_2 = children_idx[1] ? array[ children_idx[1]] : child_1


      if prc.call(parent, child_1) > -1 || prc.call(parent, child_2) > -1

        swap_idx = prc.call(child_1, child_2) < 1 ? children_idx[0] : children_idx[1]
        swap = array[swap_idx]

        array[parent_idx], array[swap_idx] = swap, parent
        parent_idx = swap_idx
      else
        return array
      end

      children_idx = self.child_indices(len, parent_idx)
    end
    array
  end


  def self.heapify_up(array, child_idx, len = array.length, &prc)

    prc = prc.nil? ? Proc.new { |el1, el2| el1 <=> el2 } : prc

    while child_idx > 0
      parent_idx = self.parent_index(child_idx)
      parent, child = array[parent_idx], array[child_idx]

      if prc.call(parent, child) >= 0
        array[parent_idx], array[child_idx] = child, parent
        child_idx = parent_idx
      else
        return array
      end
    end

    array
  end
end

def should_swap?(parent, child_1, child_2)

end
