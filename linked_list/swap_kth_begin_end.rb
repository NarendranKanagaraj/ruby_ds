require 'singly_linked_list.rb'

#Swap Kth node from beginning with Kth node from end in a Linked List

def create_list arr
  list = SinglyLinkedList.new
  arr.each do |i|
    list.insert_at_end i
  end
  list
end

def swap_kth list,k
  if k <= 0 || !list || !list.root
    return list
  end

  temp = list.root
  temp1 = list.root
  k_1_start = nil
  length = 1
  while length < k && temp1
    k_1_start = temp1
    temp1 = temp1.next_link
    length += 1
  end
  k_start = temp1
  if length == k
    k_1_end = nil
    while temp1.next_link
      k_1_end = temp
      temp = temp.next_link
      temp1 = temp1.next_link
      length += 1
    end
    k_end = temp
    k_1_start.next_link = k_end  if k_1_start
    k_1_end.next_link = k_start  if k_1_end
    t = k_start.next_link
    k_start.next_link = k_end.next_link
    k_end.next_link = t
    list.root = k_end if k == 1
    list.root = k_start if k == length
  end
  list
end


list = create_list [1,2,3,4,5,6]
list.display
list = swap_kth list,4
list.display
puts

list = create_list [1,2,3,4,5,6]
list.display
list = swap_kth list,1
list.display
puts

list = create_list [1,2,3,4,5,6]
list.display
list = swap_kth list,0
list.display