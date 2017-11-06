require 'spec_helper'
#require 'minitest/autorun'
#require 'minitest/spec'
$:.unshift File.expand_path(File.dirname(__FILE__) + 'lib')
require 'Alimento/Comida.rb'
require 'Alimento/List.rb'

describe Alimento do
  before :all do
    @huevo = Comida.new("Huevo", 14.1, 0.0, 19.5)
    @leche = Comida.new("Leche", 3.3, 4.8, 3.2)
    @yogurt = Comida.new("Yogurt", 3.8, 4.9, 3.8)
    @my_list = List.new(@huevo)
  end

  it 'has a version number' do
    expect(Alimento::VERSION).not_to be nil
  end

  describe "# Inicializaciones correctas" do
    it 'has a name' do
      expect(@huevo.name).to eq("Huevo")
    end

    it 'has a number of proteins' do
      expect(@huevo.proteins).to eq(14.1)
    end

    it 'has a number of carbohydrates' do
      expect(@huevo.carbohydrates).to eq(0.0)
    end

    it 'has a number of lipids' do
      expect(@huevo.lipids).to eq(19.5)
    end

    it 'show us the 3 values' do
      expect(@huevo.to_s).to eq('p: 14.1, c: 0.0, l: 19.5')
    end
  end

  describe "# Calculos con las variables" do
    it 'The number of proteins was formated' do
      expect(@huevo.format_proteins).to eq(56.4)
    end

    it 'The number of carbohydrates was formated' do
      expect(@huevo.format_ch).to eq(0)
    end

    it 'The number of lipids was formated' do
      expect(@huevo.format_lipids).to eq(175.5)
    end
  end

  
  describe "# Operación suma" do
    it 'obtain energetic value' do
      expect(@huevo.val_energ).to eq(231.9)
    end
  end

  describe "# Salidas finales" do
    it 'show us the formated values and the energetic value' do
      expect(@huevo.show_ev).to eq('The fortmated values are: p->56.4, c->0.0, l->175.5; The energ. value is -> 231.9 kcal')
    end
  end
 



  describe "#Initializing the List" do
    it 'the first node' do
      expect(@my_list.head.prev).to eq(nil)
      expect(@my_list.head.value.name).to eq("Huevo")
      expect(@my_list.head.next).to eq(nil)

      expect(@my_list.tale.prev).to eq(nil)
      expect(@my_list.tale.value.name).to eq("Huevo")
      expect(@my_list.tale.next).to eq(nil)
    end

    it 'more than one node' do
      @my_list.insert_tale(@leche)
      expect(@my_list.tale.prev.value.name).to eq("Huevo")
      expect(@my_list.tale.value.name).to eq("Leche")
      expect(@my_list.tale.value.proteins).to eq(3.3)
      expect(@my_list.tale.next).to eq(nil)

      @my_list.insert_head(@yogurt)
      expect(@my_list.head.prev).to eq(nil)
      expect(@my_list.head.value.name).to eq("Yogurt")
      expect(@my_list.head.value.lipids).to eq(3.8)
      expect(@my_list.head.next.value.name).to eq("Huevo")
    end
    
  end
end
