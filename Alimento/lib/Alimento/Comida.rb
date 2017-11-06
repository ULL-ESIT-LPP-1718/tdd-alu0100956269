
class Comida
  attr_reader :name, :proteins, :carbohydrates, :lipids
  
  def initialize (name_value, proteins_value, carbohydrates_value, lipids_value)
    @name = name_value
    @proteins = proteins_value
    @carbohydrates = carbohydrates_value
    @lipids = lipids_value
  end

#<<<<<<< HEAD
  def to_s
    "p: #{@proteins}, c: #{@carbohydrates}, l: #{@lipids}"
  end

#=======
  def format_proteins
    proteins_kcal = @proteins * 4
    return proteins_kcal
  end

  def format_ch
    ch_kcal = @carbohydrates * 4
    return ch_kcal
  end

  def format_lipids
    lipids_kcal = @lipids * 9
    return lipids_kcal
  end

  def val_energ
    @energ_val = format_proteins + format_ch + format_lipids
    return @energ_val
  end
#>>>>>>> desarrollo

  def show_ev
    "The fortmated values are: p->#{format_proteins}, c->#{format_ch}, l->#{format_lipids}; The energ. value is -> #{val_energ} kcal"
  end
end



class Comida_clasif < Comida
  attr_reader :type
 
  def initialize(name_value, proteins_value, carbohydrates_value, lipids_value, type_value)
    super (name_value, proteins_value, carbohydrates_value, lipids_value)
    @type = type_value
  end

  def to_s
    out = "#{@name} belong to #{@type} and its qualities are "
    out << super.to_s
    return out
  end
end

