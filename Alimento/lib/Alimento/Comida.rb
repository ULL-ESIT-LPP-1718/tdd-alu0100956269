
class Comida
  attr_reader :name, :proteins, :carbohydrates, :lipids
  
  def initialize (name_value, proteins_value, carbohydrates_value, lipids_value)
    @name = name_value
    @proteins = proteins_value
    @carbohydrates = carbohydrates_value
    @lipids = lipids_value
  end

end
