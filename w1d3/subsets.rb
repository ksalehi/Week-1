require 'byebug'

class Array

  def subsets
    arr = self.dup
    return [] if arr.empty?
    return [arr, []] if arr.length <= 1
    prev_subsets = arr[0..-2].subsets
    new_subsets = []
    prev_subsets.each do |subset|
      new_subsets << subset + [arr.last]
    end
    prev_subsets + new_subsets
  end

end
