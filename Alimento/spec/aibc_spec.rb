require 'spec_helper'

describe "#Índice Glucémico del alimento" do
  before :all do    

    @manzana = Comida_clasif.new("Manzana", 0.3, 12.4, 0.4, "frutas", [[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9], [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]])

    @yogurt = Comida_clasif.new("Yogurt", 3.8, 4.9, 3.8, "huevos, lacteos y helados", [[6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4], [4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]])

    @glucosa = Comida_clasif.new("Azucar", 0.0, 99.8, 0.0, "alimentos ricos en carbohidratos", [[4.9, 5.3, 5.9, 6.7, 7.2, 7.6, 8.0, 8.2, 8.2, 8.4, 8.3, 8.3, 8.0, 7.5, 7.1, 6.8, 6.8, 6.9, 6.8, 6.3, 6.2, 6.3, 6.2, 6.3, 6.1], [6.3, 5.4, 5.6, 5.7, 6.5, 7.4, 7.9, 7.4, 7.7, 7.9, 7.9, 7.8, 7.8, 7.8, 8.0, 8.5, 9.4, 10.8, 10.5, 9.1, 8.9, 8.3, 7.7, 7.6, 7.5]])
  end

  it 'has the correct initialize values' do
    expect(@manzana.name).to eq("Manzana")
    expect(@manzana.proteins).to eq(0.3)
    expect(@manzana.carbohydrates).to eq(12.4)
    expect(@manzana.lipids).to eq(0.4)
    expect(@manzana.type).to eq("frutas")
    expect(@manzana.g).to eq([[6.7, 6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9], [4.6, 4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9]])
  end

  it 'imperative aibc' do
    expect(@manzana.aibc_imperative).to eq([27.999999999999993, 183.25])
  end

  it 'funcional aibc' do
    expect(@manzana.aibc_funcional).to  eq([27.999999999999993, 183.25])
  end

  it 'IG manzana' do
    igind = @manzana.aibc_funcional.zip(@glucosa.aibc_funcional).collect{|i| i.reduce(:/)}.collect{|j| j*100}
    sizem=igind.size
    igm = igind.reduce(:+) / sizem
    expect(igm).to eq(52.21619897959183)
  end
end
