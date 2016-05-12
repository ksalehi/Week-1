def range(start, finish)
  return [] if finish < start
  [ start ] + range(start+1, finish)
end

def recursive_array_sum(arr)
  return arr.first if arr.length <= 1
  arr.first + recursive_array_sum(arr[1..-1])
end

def iterative_array_sum(arr)
  arr.inject(:+)
end
