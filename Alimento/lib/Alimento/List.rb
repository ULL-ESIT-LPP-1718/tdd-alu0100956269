
# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class List
 
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

  def insert_mto_tale(node_array) #insert More Than One in tale
    node_array.each do |food|
      insert_tale(food)
    end
  end

  def insert_mto_head(node_array) #insert More Than One in head
    node_array.each do |food|
      insert_head(food)
    end
  end

  
end
