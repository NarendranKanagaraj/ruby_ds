require 'singly_linked_list.rb'

def create_list
  list = SinglyLinkedList.new
  list.insert_at_start 1
  list.insert_at_start 2
  list.insert_at_start 3
  list.insert_at_end 4
  list.insert_at_start 4
  list.insert_at_end 5
  list
end

def reverse_iterative list
  temp = nil
  temp1 = list.root
  while temp1
    temp2 = temp1.next_link
    temp1.next_link = temp
    temp = temp1
    temp1 = temp2
  end
  list.root = temp
  list
end

def reverse_recursive list
  list.root = recursive_helper list.root,nil
  list
end

def recursive_helper node,prev
  if !node
    return nil
  end
  root = recursive_helper node.next_link,node
  node.next_link = prev
  root = node if root == nil
  root
end

list = create_list
list.display
reversed_list = reverse_iterative list
reversed_list.display
list = create_list
list.display
reversed_list = reverse_recursive list
reversed_list.display