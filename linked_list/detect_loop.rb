require 'singly_linked_list.rb'

#Detect a loop in linked list

def create_list arr
  list = SinglyLinkedList.new
  arr.each do |i|
    list.insert_at_end i
  end
  list
end

def detect list
  if !list || !list.root
    return false
  end
  slow = list.root
  fast = list.root
  while slow && fast && fast.next_link
    slow = slow.next_link
    fast = fast.next_link.next_link
    if slow == fast
      return true
    end
  end
  false
end

list1 = create_list [1,2,3,4]
temp = list1.root
while temp.next_link
  temp = temp.next_link
end
temp.next_link = list1.root.next_link
puts detect list1
list2 = create_list [1,2,3,4]
puts detect list2