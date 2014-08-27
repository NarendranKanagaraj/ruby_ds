require 'tnode.rb'
class BST
  attr_accessor :root
  
  def initialize
    @root = nil
  end

  def insert data
    new_node = TNode.new data
    if !@root
      @root = new_node
    else     
      temp = @root
      while temp
        if data < temp.data
          temp.left ? temp = temp.left : (temp.left = new_node;break)
        else
          temp.right ? temp = temp.right : (temp.right = new_node;break)
        end
      end
    end
  end

  def delete data
    @root = delete_helper @root,data
  end

  def in_order 
    in_order_helper @root
    puts
  end

  def pre_order 
    pre_order_helper @root
    puts
  end

  def post_order 
    post_order_helper @root
    puts
  end

  def level_order
    if !@root
      puts "Tree is empty"
      return
    end
    queue = []
    queue << @root
    queue << nil
    while queue.size > 0
      node = queue.shift
      if node
        print "#{node.data} "
        queue << node.left if node.left
        queue << node.right if node.right
      else
        if queue.size != 0
          queue << nil
        end
        puts
      end
    end
    puts
  end

  def min
    find_min @root
  end

  def max
    find_max @root
  end


  private

  def in_order_helper node
    if !node
      return
    end
    in_order_helper node.left
    print "#{node.data} "
    in_order_helper node.right
  end

  def pre_order_helper node
    if !node
      return
    end
    pre_order_helper node.left
    print "#{node.data} "
    pre_order_helper node.right
  end

  def post_order_helper node
    if !node
      return
    end
    post_order_helper node.left
    post_order_helper node.right
    print "#{node.data} "
  end

  def delete_helper node,data
    if !node
      return nil
    end

    if node.data == data
      if !node.left && !node.right
        return nil
      elsif (node.left && !node.right)
        return node.left
      elsif (!node.left && node.right)
        return node.right
      else
        min = find_min(node.right)
        node.data = min.data
        node.right = delete_helper node.right,min.data
        return node
      end
    else
      node.left = delete_helper node.left,data
      node.right = delete_helper node.right,data
    end
    node
  end

  def find_min node
    while node && node.left
      node = node.left
    end
    node
  end

  def find_max node
    while node && node.right
      node = node.right
    end
    node
  end

end
