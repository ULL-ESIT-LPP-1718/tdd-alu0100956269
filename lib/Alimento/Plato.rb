require 'Alimento'

class Plato
  attr_accessor :name, :vegetales, :frutas, :cereales, :proteinas, :aceites

  def initialize(name, &block)
    @name = name
    @vegetales = []
    @frutas = []
    @cereales = []
    @proteinas = []
    @aceites = []

    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval(&block) 
      end
    end
  end

    TOMATE = Comida_clasif.new("Tomate", 1.0, 3.5, 0.2, "verduras y hortalizas") 
    PLATANO = Comida_clasif.new("Plátano", 1.2, 21.4, 0.2, "frutas")
    ARROZ = Comida_clasif.new("Arroz", 6.8, 77.7, 0.6, "alimentos ricos en carbohidratos")
    LENTEJAS = Comida_clasif.new("Lentejas", 23.5, 52.0, 1.4, "alimentos ricos en carbohidratos")
    HUEVO = Comida_clasif.new("Huevo", 14.1, 0.0, 19.5, "huevos, lacteos y helados")
    ACEITE = Comida_clasif.new("Aceite de oliva", 0.0, 0.2, 99.6, "alimentos grasos")

    ALIMENTOS = [TOMATE, PLATANO, ARROZ,LENTEJAS, HUEVO, ACEITE]

    CANTIDAD = {' gramo' => 1, ' cucharada' => 2, ' cucharón' => 4, ' pieza pequeña' => 5, ' pieza mediana' => 7.5, ' pieza grande' => 10, ' taza' => 15}


  def to_s
    kcal_totales = 0
    salida = @name
    salida << "\n#{'=' * @name.size}\n\n"
    salida << "Composición nutricional \n"    
    salida << "Nombre".ljust(15)
    salida << "Glucidos".ljust(15)
    salida << "Proteinas".ljust(15)
    salida << "Lípidos".ljust(15)
    salida << "Val.Energ.".ljust(15)

    @vegetales.each{
      |value|
      index = ALIMENTOS.find_index{ |obj| obj.name == value[0] }
      salida << "\n#{ALIMENTOS[index].name}".ljust(16)
      salida << " #{ALIMENTOS[index].carbohydrates}".ljust(15)
      salida << " #{ALIMENTOS[index].proteins}".ljust(15)
      salida << " #{ALIMENTOS[index].lipids}".ljust(15)     
    
      n_o_p = /[0-9]+/.match(value[1])[0].to_i   #number_of_pieces
      t_o_p = /\D+/.match(value[1]).to_s         #type_of_piece

      if(t_o_p == '/')
        n_o_p = /[0-9]+\/[0-9]+/.match(value[1]).to_a
        dividendo = n_o_p[0][0].to_f

	puts dividendo
	divisor = n_o_p[0][2].to_i
	puts divisor
	n_o_p = dividendo / divisor 

        t_o_p = /\D+/.match(value[1].tr('/','')).to_s   
      end

      total_value = CANTIDAD[t_o_p] * n_o_p * ALIMENTOS[index].val_energ
      kcal_totales += total_value
      salida << " %0.2f".ljust(15) % [total_value]
    }
    
    @frutas.each{
      |value|
      index = ALIMENTOS.find_index{ |obj| obj.name == value[0] }
      salida << "\n#{ALIMENTOS[index].name}".ljust(16)
      salida << " #{ALIMENTOS[index].carbohydrates}".ljust(15)
      salida << " #{ALIMENTOS[index].proteins}".ljust(15)
      salida << " #{ALIMENTOS[index].lipids}".ljust(15)     
    
      n_o_p = /[0-9]+/.match(value[1])[0].to_i   #number_of_pieces
      t_o_p = /\D+/.match(value[1]).to_s         #type_of_piece

      if(t_o_p == '/')
        n_o_p = /[0-9]+\/[0-9]+/.match(value[1]).to_a
        dividendo = n_o_p[0][0].to_f

	puts dividendo
	divisor = n_o_p[0][2].to_i
	puts divisor
	n_o_p = dividendo / divisor 

        t_o_p = /\D+/.match(value[1].tr('/','')).to_s   
      end

      total_value = CANTIDAD[t_o_p] * n_o_p * ALIMENTOS[index].val_energ
      kcal_totales += total_value
      salida << " %0.2f".ljust(15) % [total_value]
    }
   
    @cereales.each{
      |value|
      index = ALIMENTOS.find_index{ |obj| obj.name == value[0] }
      salida << "\n#{ALIMENTOS[index].name}".ljust(16)
      salida << " #{ALIMENTOS[index].carbohydrates}".ljust(15)
      salida << " #{ALIMENTOS[index].proteins}".ljust(15)
      salida << " #{ALIMENTOS[index].lipids}".ljust(15)     
    
      n_o_p = /[0-9]+/.match(value[1])[0].to_i   #number_of_pieces
      t_o_p = /\D+/.match(value[1]).to_s         #type_of_piece

      if(t_o_p == '/')
        n_o_p = /[0-9]+\/[0-9]+/.match(value[1]).to_a
        dividendo = n_o_p[0][0].to_f

	puts dividendo
	divisor = n_o_p[0][2].to_i
	puts divisor
	n_o_p = dividendo / divisor 

        t_o_p = /\D+/.match(value[1].tr('/','')).to_s   
      end

      total_value = CANTIDAD[t_o_p] * n_o_p * ALIMENTOS[index].val_energ
      kcal_totales += total_value
      salida << " %0.2f".ljust(15) % [total_value]
    }

    @proteinas.each{
      |value|
      index = ALIMENTOS.find_index{ |obj| obj.name == value[0] }
      salida << "\n#{ALIMENTOS[index].name}".ljust(16)
      salida << " #{ALIMENTOS[index].carbohydrates}".ljust(15)
      salida << " #{ALIMENTOS[index].proteins}".ljust(15)
      salida << " #{ALIMENTOS[index].lipids}".ljust(15)     
    
      n_o_p = /[0-9]+/.match(value[1])[0].to_i   #number_of_pieces
      t_o_p = /\D+/.match(value[1]).to_s         #type_of_piece

      if(t_o_p == '/')
        n_o_p = /[0-9]+\/[0-9]+/.match(value[1]).to_a
        dividendo = n_o_p[0][0].to_f

	puts dividendo
	divisor = n_o_p[0][2].to_i
	puts divisor
	n_o_p = dividendo / divisor 

        t_o_p = /\D+/.match(value[1].tr('/','')).to_s   
      end

      total_value = CANTIDAD[t_o_p] * n_o_p * ALIMENTOS[index].val_energ
      kcal_totales += total_value
      salida << " %0.2f".ljust(15) % [total_value]
    }

    @aceites.each{
      |value|
      index = ALIMENTOS.find_index{ |obj| obj.name == value[0] }
      salida << "\n#{ALIMENTOS[index].name}".ljust(16)
      salida << " #{ALIMENTOS[index].carbohydrates}".ljust(15)
      salida << " #{ALIMENTOS[index].proteins}".ljust(15)
      salida << " #{ALIMENTOS[index].lipids}".ljust(15)     
    
      n_o_p = /[0-9]+/.match(value[1])[0].to_i   #number_of_pieces
      t_o_p = /\D+/.match(value[1]).to_s         #type_of_piece

      if(t_o_p == '/')
        n_o_p = /[0-9]+\/[0-9]+/.match(value[1]).to_a
        dividendo = n_o_p[0][0].to_f

	puts dividendo
	divisor = n_o_p[0][2].to_i
	puts divisor
	n_o_p = dividendo / divisor 

        t_o_p = /\D+/.match(value[1].tr('/','')).to_s   
      end

      total_value = CANTIDAD[t_o_p] * n_o_p * ALIMENTOS[index].val_energ
      kcal_totales += total_value
      salida << " %0.2f".ljust(15) % [total_value]
      
    }

    salida << "\n\n ".ljust(47)
    salida << "kcal totales: %0.2f" % [kcal_totales]
    salida
  end


  def vegetal(name, options = {})
    vegetal = []
    vegetal[0] = name
    vegetal[1] = "#{options[:porcion]}" if options[:porcion]
    @vegetales << vegetal
  end

  def fruta(name, options = {})
    fruta = []
    fruta[0] = name
    fruta[1] = "#{options[:porcion]}" if options[:porcion]
    @frutas << fruta
  end

  def cereal(name, options = {})
    cereal = []
    cereal[0] = name
    cereal[1] = "#{options[:porcion]}" if options[:porcion]
    @cereales << cereal
  end

  def proteina(name, options = {})
    proteina = []
    proteina[0] = name
    proteina[1] = "#{options[:porcion]}" if options[:porcion]
    @proteinas << proteina
  end

  def aceite(name, options = {})
    aceite = []
    aceite[0] = name
    aceite[1] = "#{options[:porcion]}" if options[:porcion]
    @aceites << aceite
  end

    


=begin
    Comida_clasif: LECHE = Comida_clasif.new("Leche", 3.3, 4.8, 3.2, "huevos, lacteos y helados")
    Comida_clasif: YOGURT = Comida_clasif.new("Yogurt", 3.8, 4.9, 3.8, "huevos, lacteos y helados")
    Comida_clasif: CERDO = Comida_clasif.new("Cerdo", 21.5, 0.0, 6.3, "carnes y derivados")
    Comida_clasif: TERNERA = Comida_clasif.new("Ternera", 21.1, 0.0, 3.1, "carnes y derivados")
    Comida_clasif: POLLO = Comida_clasif.new("Pollo", 20.6, 0.0, 5.6, "carnes y derivados")
    Comida_clasif: BACALAO = Comida_clasif.new("Bacalao", 17.7, 0.0, 0.4, "pescados y mariscos")
    @atun = Comida_clasif.new("Atun", 21.5, 0.0, 15.5, "pescados y mariscos")
    @salmon = Comida_clasif.new("Salmon", 19.9, 0.0, 13.6, "pescados y mariscos")
    @mantequilla = Comida_clasif.new("Mantequilla", 0.7, 0.0, 83.2, "alimentos grasos") 
    @chocolate = Comida_clasif.new("Chocolate", 5.3, 47.0, 30.0, "alimentos grasos")   
    @azucar = Comida_clasif.new("Azucar", 0.0, 99.8, 0.0, "alimentos ricos en carbohidratos")
    @papas = Comida_clasif.new("Papas", 2.0, 15.4, 0.1, "alimentos ricos en carbohidratos")
    @cebolla = Comida_clasif.new("Cebolla", 1.3, 5.8, 0.3, "verduras y hortalizas")
    @calabaza = Comida_clasif.new("Calabaza", 1.1, 4.8, 0.1, "verduras y hortalizas")
    @manzana = Comida_clasif.new("Manzana", 0.3, 12.4, 0.4, "frutas")
    @pera = Comida_clasif.new("Pera", 0.5, 12.7, 0.3, "frutas")

    @my_list = List.new(@huevo)
    @my_list.insert_mto_tale([@leche, @yogurt, @cerdo, @ternera, @pollo, @bacalao, @atun, @salmon, @aceite, @mantequilla, @chocolate, @azucar, @arroz, @lentejas, @papas, @tomate, @cebolla, @calabaza, @manzana, @platano, @pera])
=end

    


end
