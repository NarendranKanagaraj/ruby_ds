require 'bst.rb'

def create_tree
  tree = BST.new
  tree.insert 4
  tree.insert 2
  tree.insert 3
  tree.insert 6
  tree.insert 5
  tree.insert 7
  tree.insert 8
  tree
end

def max_height_of_tree node
  if !node
    return 0
  end
  1 + [max_height_of_tree(node.left), max_height_of_tree(node.right)].max
end

def min_height_of_tree node
  if !node
    return 0
  end
  1 + [min_height_of_tree(node.left), min_height_of_tree(node.right)].min
end

tree = create_tree
tree.level_order
puts max_height_of_tree tree.root
puts min_height_of_tree tree.root