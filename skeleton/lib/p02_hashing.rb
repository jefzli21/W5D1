class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    sum = 0
    self.each_with_index do |ele, idx|
      new_ele = ele.hash + idx
      sum += new_ele
    end
      sum
  end
end

class String
  def hash
    alphabet = ('a'..'z').to_a
    num = 0

    self.each_char.with_index do |char, idx|
      alp = alphabet.index(char).hash * idx 
      num += alp
    end
    num
    
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0


    self.each.with_index do |key, value, idx| 
      sum += value.hash

    end

    sum
  end
end
