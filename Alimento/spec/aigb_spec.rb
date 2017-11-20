require 'spec_helper'

describe "#Índice Glucémico del alimento" do
  before :all do    

    @list_1_m = List.new(6.7)
    @list_1_m.insert_mto_tale([6.5, 6.8, 6.9, 7.0, 7.1, 6.9, 6.9, 6.9, 6.7, 6.9, 7.3, 7.0, 7.0, 7.2, 7.1, 6.8, 7.2, 7.3, 7.0, 6.8, 6.7, 6.8, 6.7, 6.9])

    @list_2_m = List.new(4.6)
    @list_2_m.insert_mto_tale([4.8, 5.3, 5.6, 6.1, 6.5, 6.6, 7.0, 7.0, 6.8, 6.4, 6.3, 6.1, 6.1, 6.2, 6.0, 6.1, 6.1, 6.2, 6.3, 6.4, 6.1, 6.1, 5.7, 5.9])

    @manzana = Comida_clasif.new("Manzana", 0.3, 12.4, 0.4, "frutas", [@list_1_m, @list_2_m])

    @yogurt = Comida_clasif.new("Yogurt", 3.8, 4.9, 3.8, "huevos, lacteos y helados", [[6.1, 6.6, 6.3, 6.3, 6.1, 6.9, 6.8, 6.5, 6.4, 6.9, 6.8, 6.5, 6.3, 6.2, 6.7, 6.2, 5.9, 5.8, 5.8, 5.8, 5.8, 5.8, 5.9, 6.2, 6.4], [4.9, 4.9, 5.2, 5.8, 6.5, 7.0, 7.2, 7.3, 7.3, 6.6, 6.2, 6.1, 6.0, 6.1, 5.9, 5.9, 5.9, 5.9, 5.8, 5.8, 5.5, 5.5, 5.6, 5.9, 5.9]])
  end

  it 'has the correct initialize values' do
    expect(@manzana.name).to eq("Manzana")
    expect(@manzana.proteins).to eq(0.3)
    expect(@manzana.carbohydrates).to eq(12.4)
    expect(@manzana.lipids).to eq(0.4)
    expect(@manzana.type).to eq("frutas")
    expect(@manzana.g).to eq([@list_1_m, @list_2_m])
  end

  it 'imperative aibc' do
    expect(@yogurt.aibc_imperative).to eq([27.999999999999993, 183.25])
  end

  it 'funcional aibc' do
    @list_expe = List.new(27.999999999999993)
    @list_expe_2 = List.new(183.25)
    expect(@manzana.aibc_funcional).to  eq([@list_expe, @list_expec_2])
  end
end
