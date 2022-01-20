#this algorithm aims at going through the elements and then sorting to some defined condition
#we set initial element at index as the smallest element
#we go through the whole list to find the smallest from there then we store that in a new list as our sorted list

def selection_sort(arr)
  sorted_array = []
  

  while(arr.length > 0)
    smallest_item = arr[0]
    smallest_item_index = 0

    arr.each_with_index do |a, i|
      if a < smallest_item
        smallest_item = a
        smallest_item_index = i
      end
    end

    sorted_array.push(arr.delete_at(smallest_item_index))
  end

  sorted_array  
end

print selection_sort([12,3,5,6,7,8])

#selection sort swapping way

def selection_sort_swapping(arr)
  
  arr.each_with_index do |a, i|
    smallest_index = i
    smallest_item = a
    (i..arr.length - 1).each do |b|
      if arr[b] < smallest_item
        smallest_index = b
        smallest_item = arr[b]
      end
    end
    
    
    #now lets swap them
    #small visualizer
    puts i
    arr[i] = smallest_item
    puts smallest_item
    arr[smallest_index] = a
    puts smallest_index
    print arr 
    puts "\n -----"
  end
  
  print arr


end

print selection_sort_swapping([12,3,5,6,7,8])
