class DNode
  attr_accessor :data,:next_link,:prev_link

  def initialize data=nil,next_link=nil,prev_link=nil
    self.data = data
    self.next_link = nil
    self.prev_link = nil
  end

end