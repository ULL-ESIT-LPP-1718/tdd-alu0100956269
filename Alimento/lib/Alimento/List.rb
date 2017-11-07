
# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

class List
 
  attr_reader :head, :tale

  def initialize (node)
    @head = Node.new(node,nil,nil)
    @tale = @head
  end

  def to_s
    aux="{"
    node = Node.new
    node = @head
    while (node != tale) do
      aux += node.value.name
      aux += ", "
      node = node.next
    end
    aux += node.value.name
    aux += "}"
    return aux
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

  def extract_tale
    extracted_node = Node.new
    extracted_node = @tale
    @tale = @tale.prev
    @tale.next = nil
    extracted_node.prev = nil
    return extracted_node
  end

  def extract_head
    extracted_node = Node.new
    extracted_node = @head
    @head = @head.next
    @head.prev = nil
    extracted_node.next = nil
    return extracted_node
  end
  
end
