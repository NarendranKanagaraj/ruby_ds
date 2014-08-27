require 'dnode.rb'
class DoublyLinkedList
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert_at_start data
    new_node = DNode.new data
    if !@root
      @root = new_node
    else
      temp = @root.next_link
      @root.next_link = new_node
      new_node.prev_link = @root
      new_node.next_link = temp
      temp.prev_link = new_node if temp
    end
  end

  def insert_at_end data
    new_node = DNode.new data
    if !@root
      @root = new_node
    else
      temp = @root
      while temp.next_link
        temp = temp.next_link
      end
      temp.next_link = new_node
      new_node.prev_link = temp
    end
  end

  def delete data
    temp = @root
    while temp
      if temp.data == data
        temp.prev_link ? temp.prev_link.next_link = temp.next_link : @root = temp.next_link
        temp.next_link.prev_link = temp.prev_link if temp.next_link
      end
      temp = temp.next_link
    end
  end

  def display
    temp = @root
    print "["
    while temp
      print "#{temp.data}"
      temp = temp.next_link
      print ", " if temp
    end
    print "]\n"
  end

  def include? data
    temp = @root
    while temp
      if temp.data == data
        return true
      end
      temp = temp.next_link
    end
    false
  end

end