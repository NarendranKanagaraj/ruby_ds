require 'singly_linked_list.rb'

#Given a linked list, reverse alternate nodes and append at the end

def create_list
  list = SinglyLinkedList.new
  list.insert_at_end 1
  list.insert_at_end 2
  list.insert_at_end 3
  list.insert_at_end 4
  list.insert_at_end 5
  list.insert_at_end 6
  list
end

def reverse_alternate list
  if !list || !list.root
    return list
  end
  even_root = nil
  temp = list.root
  while temp && temp.next_link
    next_node = temp.next_link.next_link
    even_root = push_to_even(temp.next_link, even_root) 
    temp.next_link = next_node
    temp = temp.next_link if temp.next_link
  end
  temp.next_link = even_root
  list
end

def push_to_even node,root
  if !root
    node.next_link = nil
    root = node
  else
    node.next_link = root
    root = node
  end
  root
end


list = create_list
list.display
reversed_list = reverse_alternate list
reversed_list.display