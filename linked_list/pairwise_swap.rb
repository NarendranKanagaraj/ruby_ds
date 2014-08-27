require 'singly_linked_list.rb'

#Pairwise swap elements of a given linked list by changing links

def create_list
  list = SinglyLinkedList.new
  list.insert_at_end 1
  list.insert_at_end 2
  list.insert_at_end 3
  list.insert_at_end 4
  list.insert_at_end 5
  list.insert_at_end 6
  list.insert_at_end 7
  list
end

def pairwise_swap list
  if !list || !list.root
    return list
  end
  list.root = helper list.root
  list
end

def helper node
  if !node ||!node.next_link
    return node
  end
  current_node = node
  next_node = node.next_link
  temp = next_node.next_link
  next_node.next_link = node
  node.next_link = helper temp
  next_node
end


list = create_list
list.display
reversed_list = pairwise_swap list
reversed_list.display