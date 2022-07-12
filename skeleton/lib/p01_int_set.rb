class MaxIntSet
 
  attr_reader :max, :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > max || 0 > num
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  
  attr_accessor :store
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    store[num % num_buckets] << num
  end

  def remove(num)
    store[num % num_buckets].delete(num) 
  end

  def include?(num)
    store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !store[num % num_buckets].include?(num)
      # p "triggered"
      if @count == num_buckets 
        resize!
      end
      store[num % num_buckets] << num 
      @count += 1
    end

    
  end

  def remove(num)
    if store[num % num_buckets].include?(num)
      store[num % num_buckets].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!

    if count == num_buckets
      arr = []

      store.each do |ele|
        arr << ele
      end

      num_buck = num_buckets * 2

      @store = Array.new(num_buck) { Array.new }
      @count = 0
      
      arr.each do |ele| 
        if ele.is_a?(Array)
          ele.each do |ele2|
            self.insert(ele2) 
          end
        else 
          self.insert(ele)
        end
      end
    end
  end
end
