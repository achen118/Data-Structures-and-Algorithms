# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to



def install_order(arr)
  all_ids = (1 .. arr.flatten.max).to_a
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each { |el| hash[el[0]] += [el[1]] }

  queue = all_ids.reject{ |id| hash.keys.include?(id)}
  resolved = []

  until queue.empty?
    id = queue.shift
    resolved << id

    hash.keys.each do |d_id|
      hash[d_id] -= [id]
      if hash[d_id].empty?
        queue << d_id
        hash.delete(d_id)
      end
    end

  end

  resolved
end
