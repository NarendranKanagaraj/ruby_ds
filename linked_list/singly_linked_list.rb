require 'snode.rb'
class SinglyLinkedList
  
  def initialize
    @root = SNode.new
  end

  def insert_at_start data
    temp = @root.next_link
    new_node= SNode.new data
    @root.next_link = new_node
    new_node.next_link = temp
  end

  def insert_at_end data
    temp = @root
    new_node= SNode.new data
    while temp.next_link
      temp = temp.next_link
    end
    temp.next_link = new_node
  end

  def delete data
    temp = @root
    prev = temp
    while temp.next_link
      if temp.data == data
        prev.next_link = temp.next_link
      end
      prev = temp
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

list = SinglyLinkedList.new
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