
class Comida
  attr_reader :name, :proteins, :carbohydrates, :lipids
  
  def initialize (name_value, proteins_value, carbohydrates_value, lipids_value)
    @name = name_value
    @proteins = proteins_value
    @carbohydrates = carbohydrates_value
    @lipids = lipids_value
  end

<<<<<<< HEAD
  def to_s
    "p: #{@proteins}, c: #{@carbohydrates}, l: #{@lipids}"
  end

=======
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
>>>>>>> desarrollo
end
