class SNode
  attr_accessor :data,:next_link

  def initialize data=nil,next_link=nil
    self.data = data
    self.next_link = nil
  end
  
end