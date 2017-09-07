class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.empty?

    #Choose a random element and re-assign it to the start to optimize for mostly sorted arrays
    new_pivot = rand(array.length)
    array[0], array[new_pivot] = array[new_pivot], array[0]

    pivot = array[0]

    left = array.select { |el| pivot > el }
    middle = array.select { |el| pivot == el }
    right = array.reject { |el| pivot > el }

    sort1(left) + middle + sort1(right)
  end

    # In-place. Uses O(log(n)) space for recursion.
  def self.sort2!(array, start_idx = 0, length = array.length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    return array if length < 2

    pivot_idx = partition(array, start_idx, length, &prc)

    left_length = pivot_idx - start_idx
    right_length = length - (left_length + 1)
    sort2!(array, start_idx, left_length, &prc)
    sort2!(array, pivot_idx + 1, right_length, &prc)

    array
  end

  def self.partition(array, start_idx, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

  #should really choose a random index and re-assign it to the start to optimize for mostly sorted arrays

    pivot_idx = start_idx
    pivot = array[start_idx]

    ((start_idx + 1)...(start_idx + length)).each do |idx|
      if prc.call(pivot, array[idx]) > 0
        array[idx], array[pivot_idx + 1] = array[pivot_idx + 1], array[idx]
        pivot_idx += 1
      end
    end
    array[start_idx], array[pivot_idx] = array[pivot_idx], array[start_idx]

    pivot_idx
  end
end
