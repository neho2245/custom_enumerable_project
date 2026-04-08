module Enumerable
  # Your code goes here
  def my_each_with_index
      return to_enum(:my_each_with_index) unless block_given?
      i = 0
      self.my_each do |element|
        yield element, i
        i += 1
      end
      return self
  end

  def my_select
      keep = []
      return to_enum(:my_select) unless block_given?
      self.my_each do |element|
          keep << element if yield element
      end
      keep
  end

  def my_all?
      return to_enum(:my_all?) unless block_given?
      self.my_each do |element|
          return false unless yield element
      end
      true
  end

  def my_any?
      return to_enum(:my_any?) unless block_given?
      self.my_each do |element|
          return true if yield element
      end
      false
  end

  def my_none?
      return to_enum(:my_none?) unless block_given?
      self.my_each do |element|
          return false if yield element
      end
      true
  end

  def my_count
      return self.size unless block_given?
      counter = 0
      self.my_each do |element|
          counter += 1 if yield element
      end
      counter
  end

  def my_map
      return to_enum(:my_map) unless block_given?
      res = []
      self.my_each do |element| 
          func_res = yield(element)
          res << func_res
      end
      res
  end

  def my_inject(initial_value)
      accumulator = initial_value
      self.my_each do |element|
          accumulator = yield accumulator, element
      end
      accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?
    i = 0
    while i < self.length
        yield self[i]
        i += 1
    end
    self
  end
end
