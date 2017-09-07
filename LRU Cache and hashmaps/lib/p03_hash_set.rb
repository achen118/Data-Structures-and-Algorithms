require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @store.length == @count
    num = key.hash
    self[num] << key
    @count += 1
  end

  def include?(key)
    num = key.hash

    self[num].include?(key)
  end

  def remove(key)
    num = key.hash

    self[num].delete(key)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_length = @store.length * 2
    old_store, @store = @store, Array.new(new_length) { Array.new }

    old_store.flatten.each{ |el| @store[el % new_length] << el}
  end
end
