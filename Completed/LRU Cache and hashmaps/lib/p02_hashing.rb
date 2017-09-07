class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    num = 3
    self.each_with_index do | el, idx |
      return el.hash if el.is_a?(Array)
      num *= (el / (idx + 1)) + el + 21341123
    end
    num.hash
  end

end

class String
  def hash
    nums = chars.map { |ch| ch.ord }
    nums.hash
  end
end
#
class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    key_array = keys.map do | key |
      (key.to_s + self[key].to_s).hash
    end

    key_array.sort.hash
  end
end
