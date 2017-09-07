require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    return bucket(key).update(key, val) if include?(key)

    resize! if @count == num_buckets

    bucket(key).append(key, val)
    @count += 1
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    return nil unless include?(key)
    @count -= 1
    bucket(key).remove(key)
  end

  def each
    @store.each do |list|
      list.each { |node| yield [node.key, node.val]}
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store, @store = @store, Array.new(num_buckets * 2) { LinkedList.new }

    old_store.each do |list|
      list.each { |node| set(node.key, node.val)}
    end
  end

  def bucket(key)
    @store[key.hash % num_buckets]
  end

end
