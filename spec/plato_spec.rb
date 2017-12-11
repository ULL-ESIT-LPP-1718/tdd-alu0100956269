require 'spec_helper'
$:.unshift File.expand_path(File.dirname(__FILE__) + 'lib')

describe Plato do
  it 'good initialize of plato' do
    lentejas_arroz = Plato.new("Lentejas con arroz, salsa de tomate, huevo y pl ́atano a la plancha") do
      vegetal     "Tomate",
      :porcion => "2 pieza pequeña"

      fruta       "Plátano",
      :porcion => "20 gramo"

      cereal      "Arroz",
      :porcion => "1 taza"

      proteina    "Lentejas",
      :porcion => "1/2 cucharón"
      
      proteina    "Huevo",
      :porcion => "1 pieza mediana"

      aceite      "Aceite de oliva",
      :porcion => "1/2 cucharada"
    end

    puts lentejas_arroz
  end

end
