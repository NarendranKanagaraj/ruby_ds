require 'snode.rb'
class SinglyLinkedList
  attr_accessor :root
  
  def initialize
    @root = nil
  end

  def insert_at_start data
    new_node = SNode.new data
    if !@root
      @root = new_node
    else
      temp = @root.next_link
      @root.next_link = new_node
      new_node.next_link = temp
    end
  end

  def insert_at_end data   
    new_node = SNode.new data
    if !@root
      @root = new_node
    else
      temp = @root
      while temp.next_link
        temp = temp.next_link
      end
      temp.next_link = new_node
    end
  end

  def delete data
    temp = @root
    prev = nil
    while temp
      if temp.data == data
        prev ? prev.next_link = temp.next_link : @root = nil
      else
        prev = temp
        temp = temp.next_link
      end
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