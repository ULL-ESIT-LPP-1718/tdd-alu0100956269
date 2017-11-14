# encoding: utf-8
# Author::    Juan Carlos González Pascolo  (mailto:alu0100956269@ull.edu.es)
# Copyright:: Cretive Commons
# License::   Distributes under the same terms as Ruby

#Esta clase permite ver los distintos componentes de un alimento y su valor energético
#Se ha incluido el mixin Comparable
class Comida
  include Comparable

  #Getters de las distintas variables de instancia
  attr_reader :name, :proteins, :carbohydrates, :lipids
  
  #Se asignan los valores que debe tener el alimento, es decir, 
  #su nombre, numero de proteinas, glúcidos (carbohidratos) y lípidos
  def initialize (name_value, proteins_value, carbohydrates_value, lipids_value)
    @name = name_value
    @proteins = proteins_value
    @carbohydrates = carbohydrates_value
    @lipids = lipids_value
  end
#--
#<<<<<<< HEAD
#++
  #Función to_string
  def to_s
    "p: #{@proteins}, c: #{@carbohydrates}, l: #{@lipids}"
  end
#--
#======= hecho por el merge
#++
  #Función que devuelve las kcalorias del alimento por su número de proteinas
  def format_proteins
    proteins_kcal = @proteins * 4
    return proteins_kcal
  end

  #Función que devuelve las kcalorias del alimento por su número de glúcidos
  def format_ch
    ch_kcal = @carbohydrates * 4
    return ch_kcal
  end

  #Función que devuelve las kcalorias del alimento por su número de lípidos
  def format_lipids
    lipids_kcal = @lipids * 9
    return lipids_kcal
  end

  #Función que devuelve las kcalorias totales del alimento
  def val_energ
    @energ_val = format_proteins + format_ch + format_lipids
    return @energ_val
  end
#--
#>>>>>>> desarrollo
#++

  #Metodo que convierte a string los componentes del alimento en kcaloría y su valor energético total
  def show_ev
    "The fortmated values are: p->#{format_proteins}, c->#{format_ch}, l->#{format_lipids}; The energ. value is -> #{val_energ} kcal"
  end

  # Se define para incluir el mixin comparable
  # Se toma como valor para la comparación el valor energético
  # y para saber si son iguales también se toma el nombre.
  def <=>(other_food) 
    return nil unless other_food.is_a?Comida
    val_energ <=> other_food.val_energ
  end

  #para comparar se debe pasar otra comida como argumento
  def ==(other_food)
    return nil unless other_food.is_a?Comida
    (@name == other_food.name) && (val_energ == other_food.val_energ)
  end
end


#Clase derivada, en la cual se añade el tipo de alimento que es.
class Comida_clasif < Comida
  #para que se pueda tener el getter del tipo de alimento
  attr_reader :type
 
  #Llama al initialize de su clase padre para todos los valores menos para el tipo,
  #que se asigna en esta clase
  def initialize(name_value, proteins_value, carbohydrates_value, lipids_value, type_value)
    super(name_value, proteins_value, carbohydrates_value, lipids_value)
    @type = type_value
  end

  #metodo to_string que añade, al principio, al string de la clase padre el tipo de alimento que es
  def to_s
    out = "#{@name} belong to #{@type} and its qualities are "
    out << super.to_s
    return out
  end
end

