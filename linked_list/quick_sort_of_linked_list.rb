require 'singly_linked_list.rb'

#Quick sort of linked list

def create_list arr
  list = SinglyLinkedList.new
  arr.each do |i|
    list.insert_at_end i
  end
  list
end

def quick_sort list
  if !list || !list.root  || !list.root.next_link
    return list
  end
  list.root = quick_sort_helper list.root, get_last(list.root)
  list
end

def quick_sort_helper start_node, end_node
  if !start_node
    return nil
  end
  new_start, new_end, pivot = divide start_node, end_node
  if new_start != pivot
    pivot_prev = new_start
    while pivot_prev.next_link != pivot
      pivot_prev = pivot_prev.next_link
    end
    pivot_prev.next_link = nil
    l_start = quick_sort_helper new_start, pivot_prev
    l_end = get_last l_start
    l_end.next_link = pivot
    new_start = l_start
  end
  r_start = quick_sort_helper pivot.next_link, new_end if pivot.next_link
  pivot.next_link = r_start
  new_start
end

def divide start_node, end_node
  pivot = end_node
  temp = start_node
  prev = nil
  new_start = pivot
  new_end = pivot
  while temp != pivot && temp
    if temp.data < pivot.data
      new_start = temp if new_start == pivot
      prev = temp
      temp1 = temp.next_link
    else
      prev.next_link = temp.next_link if prev
      temp1 = temp.next_link
      temp.next_link = pivot.next_link
      pivot.next_link = temp
      new_end = temp if new_end == pivot
    end
    temp = temp1
  end
  [new_start, new_end, pivot]
end

def get_last node
  if !node
    return node
  end
  while node.next_link
    node = node.next_link
  end
  node
end

list = create_list [2,1,5,4,3,7,6]
list.display
quick_sort list
list.display