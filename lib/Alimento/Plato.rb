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

  def to_s
    salida = @name
    salida << "\n#{'=' * @name.size}\n\n"
    salida << "Composición nutricional \n"    
    

    salida
  end


  def vegetal(name, options = {})
    vegetal = name
    vegetal << " (#{options[:porcion]})" if options[:porcion]
    @vegetales << vegetal
  end

  def fruta(name, options = {})
    fruta = name
    fruta << " (#{options[:porcion]})" if options[:porcion]
    @frutas << fruta
  end

  def cereal(name, options = {})
    cereal = name
    cereal << " (#{options[:porcion]})" if options[:porcion]
    @cereales << cereal
  end

  def proteina(name, options = {})
    proteina = name
    proteina << " (#{options[:porcion]})" if options[:porcion]
    @proteinas << proteina
  end

  def aceite(name, options = {})
    aceite = name
    aceite << " (#{options[:porcion]})" if options[:porcion]
    @aceites << aceite
  end
end
