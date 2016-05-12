def bsearch(array, target)
  if array.length == 1
    array.first == target ? return 0 : return nil
  end
  middle_idx = array.length / 2
  if target == array[middle_idx]
    return middle_idx
  elsif target < array[middle_idx]
    index = bsearch(array[0..middle_idx - 1], target)
  else
    search = bsearch(array[middle_idx..-1], target)
    search.nil? ? return nil : index = middle_idx + search
  end
  index
end
