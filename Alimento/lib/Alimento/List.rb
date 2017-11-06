
# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class List
  @@number_of_list
 
  attr_reader :head, :tale

  def initialize (node)
    @head = Node.new(node,nil,nil)
    @tale = @head
  end

end
