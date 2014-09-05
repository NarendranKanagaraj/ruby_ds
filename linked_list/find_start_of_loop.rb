require 'singly_linked_list.rb'

#Find the start of the loop in linked list

def create_list arr
  list = SinglyLinkedList.new
  arr.each do |i|
    list.insert_at_end i
  end
  list
end

def find_start_of_loop list
  if !list || !list.root
    return nil
  end
  meeting_point = detect_loop list
  if meeting_point
    temp = list.root
    while temp != meeting_point
      temp = temp.next_link
      meeting_point = meeting_point.next_link
    end
    return temp.data
  else
    return nil
  end
end

def detect_loop list
  slow = list.root
  fast = list.root
  while slow && fast && fast.next_link
    slow = slow.next_link
    fast = fast.next_link.next_link
    if slow == fast
      return slow
    end
  end
  nil
end

list1 = create_list [1,2,3,4]
temp = list1.root
while temp.next_link
  temp = temp.next_link
end
temp.next_link = list1.root.next_link.next_link
puts find_start_of_loop list1
list2 = create_list [1,2,3,4]
puts find_start_of_loop list2