class Array
  def my_each(&blk)
    i = 0
    while i < self.length
      blk.call(self[i])
      i += 1
    end

  end

  def my_select(&blk)
    selection = []
    self.my_each do |el|
      selection << el if blk.call(el)
    end
    selection
  end

  def my_reject(&blk)
    selection = []
    self.my_each do |el|
      selection << el unless blk.call(el)
    end
    selection
  end

  def my_any?(&blk)
    self.my_each do |el|
      return true if blk.call(el)
    end

    return false
  end

  def my_all?(&blk)
    self.my_each do |el|
      return false unless blk.call(el)
    end
    return true
  end

  def my_flatten
    flattened_arr = []
    self.my_each do |item|
      if item.is_a?(Array)
        flattened_arr += item.my_flatten
      else
        flattened_arr << item
      end
    end

    flattened_arr
  end

  def my_zip(*args)
    result = Array.new(self.length) { Array.new }
    result.each_with_index do |arry, idx|
      leftovers = []
      arry[0] = self[idx]
      args.each do |arr2|
        leftovers << arr2[idx]
      end
      result[idx] += leftovers
    end

    result
  end


  def my_rotate(shift = 1)
    rotated_arr = self
    shifted_els = []
    shift = shift % 4
    shift.times do |el|
      shifted_els << rotated_arr.shift
    end

    rotated_arr += shifted_els
  end

  def my_join(string = "")
    result_string = ""
    self.each_with_index do |letter, idx|
      if idx == self.length - 1
        result_string += letter
      else
        result_string += letter + string
      end
    end

    result_string
  end

  def my_reverse
    reverse_array = []
    iterate_val = self.length
    iterate_val.times do
      reverse_array << self.pop
    end
    reverse_array

  end

end
