class TNode
  attr_accessor :data,:left,:right

  def initialize data=nil,left=nil,right=nil
    self.data = data
    self.left = nil
    self.right = nil
  end

end