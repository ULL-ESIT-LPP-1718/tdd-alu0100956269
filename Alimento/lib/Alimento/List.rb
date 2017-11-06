
# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class List
  @@number_of_list
 
  attr_reader :head, :tale

  def initialize (node)
    @head = Node.new(node,nil,nil)
    @tale = @head
  end

  def insert_tale(node)
    insertnode = Node.new(node,nil,@tale)
    @tale.next = insertnode
    @tale = insertnode
  end

  def insert_head(node)
    insertnode = Node.new(node,@head,nil)
    @head.prev = insertnode
    @head = insertnode
  end

end
