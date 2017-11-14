# encoding: utf-8
# Author::    Juan Carlos González Pascolo  (mailto:alu0100956269@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

# create a Struct with :value, :next and :prev
Node = Struct.new(:value, :next, :prev)

#Esta clase implementa una lista doblemente enlazada
#Se ha incluido el mixin Enumerable

class List
  include Enumerable

  #Getters de las distintas variables de instancia
  attr_reader :head, :tale, :num_elem
  
  #Con el primer valor que nos pasen creamos el nodo inicial que es head y tale de las lista.
  #La lista ya tiene un elemento por tanto el numero de elementos es 1
  def initialize (node)
    @head = Node.new(node,nil,nil)
    @tale = @head
    @num_elem = 1
  end
 
  #Función to_string, que solo muestra el nombre de los valores (los alimentos)
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

  #Metodo para insertar un valor por la cola
  def insert_tale(node)
    insertnode = Node.new(node,nil,@tale)
    @tale.next = insertnode
    @tale = insertnode
    @num_elem += 1
  end

  #Metodo para insertar un valor por el head
  def insert_head(node)
    insertnode = Node.new(node,@head,nil)
    @head.prev = insertnode
    @head = insertnode
    @num_elem += 1
  end

  #Metodo para insertar más de un valor por la cola
  def insert_mto_tale(node_array) #insert More Than One in tale
    node_array.each do |food|
      insert_tale(food)
    end
  end

  #Metodo para insertar más de un valor por la head
  def insert_mto_head(node_array) #insert More Than One in head
    node_array.each do |food|
      insert_head(food)
    end
  end

  #Método para extraer el último elemento (el tale)
  def extract_tale
    extracted_node = Node.new
    extracted_node = @tale
    @tale = @tale.prev
    @tale.next = nil
    extracted_node.prev = nil
    @num_elem -= 1
    return extracted_node
  end

    #Método para extraer el primer elemento (el head)
  def extract_head
    extracted_node = Node.new
    extracted_node = @head
    @head = @head.next
    @head.prev = nil
    extracted_node.next = nil
    @num_elem -= 1
    return extracted_node
  end

  # Se incluye el metodo del mixin Enumerable
  # Se define como una iteración cada uno de los valores de los nodos
  def each
    aux = Node.new
    aux = @head
    tam = @num_elem
    for i in (1..tam)
      yield aux.value
      aux = aux.next
    end

  end
  
end
