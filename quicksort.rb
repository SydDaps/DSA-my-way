def quick_sort(arr)
  #base_case
  if arr.length < 2
    return arr
  end


  #recursive_case
  lower_left = []
  greater_right = []

  pivot = arr[0]
  (1..(arr.length - 1)).each do |d|
    if pivot > arr[d]
      lower_left.push(arr[d])
    elsif pivot < arr[d]
      greater_right.push(arr[d])
    end
  end


  final_array = quick_sort(lower_left) + [pivot] + quick_sort(greater_right)
  return final_array
end

print quick_sort([44, 52, 86, 3, 56])
