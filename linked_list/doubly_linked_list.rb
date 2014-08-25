require 'dnode.rb'
class DoublyLinkedList
  
  def initialize
    @root = DNode.new
  end

  def insert_at_start data
    temp = @root.next_link
    new_node= DNode.new data
    @root.next_link = new_node
    new_node.prev_link = @root
    new_node.next_link = temp
    temp.prev_link = new_node if temp
  end

  def insert_at_end data
    temp = @root
    new_node= DNode.new data
    while temp.next_link
      temp = temp.next_link
    end
    temp.next_link = new_node
    new_node.prev_link = temp
  end

  def delete data
    temp = @root
    while temp.next_link
      if temp.data == data
        temp.prev_link.next_link = temp.next_link
        temp.next_link.prev_link = temp.prev_link
      end
      temp = temp.next_link
    end
  end

  def display
    temp = @root.next_link
    print "["
    while temp
      print "#{temp.data}"
      temp = temp.next_link
      print ", " if temp
    end
    print "]\n"
  end

  def include? data
    temp = @root.next_link
    while temp
      if temp.data == data
        return true
      end
      temp = temp.next_link
    end
    false
  end

end

list = DoublyLinkedList.new
list.insert_at_start 1
list.insert_at_start 2
list.insert_at_start 3
list.display
p list.include? 4
list.insert_at_end 4
list.insert_at_start 4
list.insert_at_end 5
list.display
p list.include? 4
list.delete 4
list.display