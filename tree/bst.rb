require 'tnode.rb'
class BST
  
  def initialize
    @root = TNode.new
  end

  def insert data
    if !@root.data
      @root.data = data
    else
      new_node = TNode.new data
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

  def in_order 
    in_order_helper @root
    puts
  end

  def in_order_helper node
    if !node
      return
    end
    in_order_helper node.left
    print "#{node.data} "
    in_order_helper node.right
  end

  def pre_order 
    pre_order_helper @root
    puts
  end

  def pre_order_helper node
    if !node
      return
    end
    pre_order_helper node.left
    print "#{node.data} "
    pre_order_helper node.right
  end

  def post_order 
    post_order_helper @root
    puts
  end

  def post_order_helper node
    if !node
      return
    end
    post_order_helper node.left
    post_order_helper node.right
    print "#{node.data} "
  end

  def level_order
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
  end

end

tree = BST.new
tree.insert 4
tree.insert 2
tree.insert 3
tree.insert 6
tree.insert 5
tree.in_order
tree.pre_order
tree.post_order
tree.level_order
