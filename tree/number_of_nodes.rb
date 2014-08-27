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

def number_of_nodes node
  if !node
    return 0
  end
  1 + number_of_nodes(node.left) + number_of_nodes(node.right)
end


def number_of_leaf_nodes node
  if !node
    return 0
  end
  if !node.left && !node.right
    return 1
  end
  number_of_leaf_nodes(node.left) + number_of_leaf_nodes(node.right)
end

tree = create_tree
tree.level_order
puts number_of_nodes tree.root
puts number_of_leaf_nodes tree.root