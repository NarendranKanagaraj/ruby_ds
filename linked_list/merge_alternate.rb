require 'singly_linked_list.rb'

#Merge a linked list into another linked list at alternate positions

def create_list arr
  list = SinglyLinkedList.new
  arr.each do |i|
    list.insert_at_end i
  end
  list
end

def merge list1,list2
  if list1 && list2 && list1.root && list2.root
    temp = list1.root
    while temp && list2.root
      temp1 = temp.next_link
      temp2 = list2.root
      list2.root = list2.root.next_link
      temp.next_link = temp2
      temp2.next_link = temp1
      temp = temp1
    end
  end
  [list1,list2]
end

list1 = create_list [1,2,3]
list2 = create_list [4,5,6,7,8]
list1.display
list2.display
list1,list2 = merge list1,list2
list1.display
list2.display

list1 = create_list [4,5,6,7,8]
list2 = create_list [1,2,3]
list1.display
list2.display
list1,list2 = merge list1,list2
list1.display
list2.display