#this is used to search for items in a sorted list
#the plan here to reduce the steps taken by the normal simple search i.e going through all the elements
#this method makes use of a maximum point and a minimum point 
#the idea here is to finds a mid point. 
#if the element being looked for exceeds this mid point our new min becomes the (mid point + 1)
#if the element being looked for does not exceeds this mid point our new max becomes the (mid point - 1) 
#this concept is repeated as long as min < max


#implementation

def binary_search(arr, el_to_find)
  min = 0
  max = arr.length - 1

  while(min <= max )
    
    mid = (min + max) / 2

    guess_element = arr[mid]
    if(guess_element == el_to_find)
      return "Found at index #{mid}"
    end
    #if element to find is higher than the guess_element we shift min to mid + 1 i.e next position after the mid point
    if(el_to_find > guess_element)
      min = mid + 1

    #if element to find is lower than the guess_element we shift max to mid - 1 i.e position before the mid point
    elsif(el_to_find < guess_element)  
      min = mid + 1
    end
  
    #tip visualize it in your head makes a lot of sense
  end
  return "Not Found"
end

#Test

list = [1,3,6,8]
puts binary_search(list, 6)

list = ["I", "Love", "Programming" , "tutorials", "urus", "van"]
puts binary_search(list, "Programming")