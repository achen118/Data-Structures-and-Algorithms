
def single_in_sorted(arr)
mid_i = arr.length / 2
left_i, right_i = mid_i - 1, mid_i + 1

  if arr[mid_i] == arr[left_i]

    left = arr[0...left_i]
    right = arr[right_i..-1]

  elsif arr[mid_i] == arr[right_i]

    left = arr[0...mid_i]
    right = arr[right_i + 1...-1]

  else
    return arr[mid_i]
  end

  if left.length.odd? search that half



end




[1, 1, 3, 4, 4, 5, 5, 6, 6]

[1, 1, 3, 5, 5]

[1, 3, 3]
