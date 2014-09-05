require 'singly_linked_list.rb'

#Merge sort of linked list

def create_list arr
  list = SinglyLinkedList.new
  arr.each do |i|
    list.insert_at_end i
  end
  list
end

def merge_sort list
  if !list || !list.root  || !list.root.next_link
    return list
  end
  list.root = merge_sort_helper list.root
  list
end

def merge_sort_helper root
  if !root || !root.next_link
    return root
  end
  first_half,second_half = divide root
  first_half = merge_sort_helper first_half
  second_half = merge_sort_helper second_half
  root = merge first_half,second_half
  root
end

def divide node
  if !node || !node.next_link
    return [node,nil]
  end
  first_half = node
  second_half = node.next_link
  while second_half
    second_half = second_half.next_link
    if second_half
      first_half = first_half.next_link
      second_half = second_half.next_link
    end
  end
  temp = first_half.next_link
  first_half.next_link = nil
  [node,temp]
end

def merge first,second
  if !first
    return second
  elsif !second
    return first
  end

  if first.data < second.data
    result = first
    result.next_link = merge first.next_link,second
  else
    result = second
    result.next_link = merge first,second.next_link
  end
  result
end

list = create_list [2,1,5,4,3,7,6]
list.display
merge_sort list
list.display