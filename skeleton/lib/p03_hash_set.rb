class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !@store[key.hash % num_buckets].include?(key)
      # p "triggered"
      if @count == num_buckets 
        resize!
      end
      @store[key.hash % num_buckets] << key 
      @count += 1
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    if @store[key.hash % num_buckets].include?(key)
      @store[key.hash % num_buckets].delete(key) 
      @count -= 1
    end
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

      @store.each do |ele|
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
