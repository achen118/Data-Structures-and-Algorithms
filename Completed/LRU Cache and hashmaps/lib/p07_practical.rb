require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new
  string.chars.each do |ch|
    if map.include?(ch)
      map[ch] += 1
    else
      map[ch] = 1
    end
  end

  odds = map.select { |_key, val| val.odd? }

  odds.count <= 1
end
