require 'byebug'

def merge_sort(arr)
  # debugger
  return arr if arr.length <= 1
  middle_idx = (arr.length - 1) / 2
  half1 = arr[0..middle_idx]
  half2 = arr[middle_idx + 1..-1]
  merge(merge_sort(half1), merge_sort(half2))
end

def merge(arr1, arr2)
  merged = []
  until arr1.length == 0 || arr2.length == 0
    a = arr1.first
    b = arr2.first
    if a < b
      merged << a
      arr1.shift
    elsif a == b
      merged << a << b
      arr1.shift
      arr2.shift
    elsif a > b
      merged << b
      arr2.shift
    end
  end
  merged + arr1 + arr2
end
