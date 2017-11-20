require 'spec_helper'
$:.unshift File.expand_path(File.dirname(__FILE__) + 'lib')


describe Alimento do
  before :all do
    @huevo = Comida_clasif.new("Huevo", 14.1, 0.0, 19.5, "huevos, lacteos y helados")
    @leche = Comida_clasif.new("Leche", 3.3, 4.8, 3.2, "huevos, lacteos y helados")
    @yogurt = Comida_clasif.new("Yogurt", 3.8, 4.9, 3.8, "huevos, lacteos y helados")
    @cerdo = Comida_clasif.new("Cerdo", 21.5, 0.0, 6.3, "carnes y derivados")
    @ternera = Comida_clasif.new("Ternera", 21.1, 0.0, 3.1, "carnes y derivados")
    @pollo = Comida_clasif.new("Pollo", 20.6, 0.0, 5.6, "carnes y derivados")
    @bacalao = Comida_clasif.new("Bacalao", 17.7, 0.0, 0.4, "pescados y mariscos")
    @atun = Comida_clasif.new("Atun", 21.5, 0.0, 15.5, "pescados y mariscos")
    @salmon = Comida_clasif.new("Salmon", 19.9, 0.0, 13.6, "pescados y mariscos")
    @aceite = Comida_clasif.new("Aceite de Oliva", 0.0, 0.2, 99.6, "alimentos grasos")
    @azucar = Comida_clasif.new("Azucar", 0.0, 99.8, 0.0, "alimentos ricos en carbohidratos")
    @tomate = Comida_clasif.new("Tomate", 1.0, 3.5, 0.2, "verduras y hortalizas") 
    @manzana = Comida_clasif.new("Manzana", 0.3, 12.4, 0.4, "frutas")

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

    it 'modification, now show us all the values' do
      expect(@huevo.to_s).to eq('Huevo belong to huevos, lacteos y helados and its qualities are p: 14.1, c: 0.0, l: 19.5')
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
 
  describe "#Herencia" do
    it 'Checking the class and the superclass' do
      expect(@leche.instance_of?Comida_clasif).to eq(true)
      expect(@leche.is_a?Comida).to eq(true)
      expect(@leche.type).to eq("huevos, lacteos y helados")

      expect(@cerdo.instance_of?Comida_clasif).to eq(true)
      expect(@cerdo.is_a?Comida).to eq(true)
      expect(@cerdo.type).to eq("carnes y derivados")

      expect(@bacalao.instance_of?Comida_clasif).to eq(true)
      expect(@bacalao.is_a?Comida).to eq(true)
      expect(@bacalao.is_a?Object).to eq(true)
      expect(@bacalao.is_a?BasicObject).to eq(true)
      expect(@bacalao.type).to eq("pescados y mariscos")

      expect(@aceite.instance_of?Comida_clasif).to eq(true)
      expect(@aceite.is_a?Comida).to eq(true)
      expect(@aceite.is_a?Object).to eq(true)
      expect(@aceite.is_a?BasicObject).to eq(true)
      expect(@aceite.type).to eq("alimentos grasos")
      expect(@aceite.proteins).to eq(0.0)

      expect(@azucar.instance_of?Comida_clasif).to eq(true)
      expect(@azucar.is_a?Comida).to eq(true)
      expect(@azucar.is_a?Object).to eq(true)
      expect(@azucar.is_a?BasicObject).to eq(true)
      expect(@azucar.type).to eq("alimentos ricos en carbohidratos")
      expect(@azucar.name).to eq("Azucar")
      expect(@azucar.proteins).to eq(0.0)

      expect(@tomate.instance_of?Comida_clasif).to eq(true)
      expect(@tomate.is_a?Comida).to eq(true)
      expect(@tomate.is_a?Object).to eq(true)
      expect(@tomate.is_a?BasicObject).to eq(true)
      expect(@tomate.type).to eq("verduras y hortalizas")
      expect(@tomate.name).to eq("Tomate")
      expect(@tomate.proteins).to eq(1.0)

      expect(@manzana.instance_of?Comida_clasif).to eq(true)
      expect(@manzana.is_a?Comida).to eq(true)
      expect(@manzana.is_a?Object).to eq(true)
      expect(@manzana.is_a?BasicObject).to eq(true)
      expect(@manzana.type).to eq("frutas")
      expect(@manzana.name).to eq("Manzana")
      expect(@manzana.proteins).to eq(0.3)
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

      expect(@my_list.num_elem).to eq(1)
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

    it 'inserting more than one node' do
      @my_list.insert_mto_tale([@cerdo, @ternera, @pollo])
      expect(@my_list.tale.prev.value.name).to eq("Ternera")
      expect(@my_list.tale.value.name).to eq("Pollo")
      expect(@my_list.tale.value.proteins).to eq(20.6)
      expect(@my_list.tale.next).to eq(nil)

      @my_list.insert_mto_head([@bacalao, @atun, @salmon])
      expect(@my_list.head.prev).to eq(nil)
      expect(@my_list.head.value.name).to eq("Salmon")
      expect(@my_list.head.value.lipids).to eq(13.6)
      expect(@my_list.head.next.value.name).to eq("Atun")

      
      expect(@my_list.num_elem).to eq(9)
    end   

    it 'proving the to_s function' do
      expect(@my_list.to_s).to eq("{Salmon, Atun, Bacalao, Yogurt, Huevo, Leche, Cerdo, Ternera, Pollo}")
    end

    it 'extracting from the tale' do
      extracted_node = Node.new
      extracted_node = @my_list.extract_tale 
      expect(extracted_node.value.name).to eq("Pollo")
      expect(extracted_node.prev).to eq(nil)
      expect(extracted_node.next).to eq(nil)
      expect(@my_list.tale.prev.value.name).to eq("Cerdo")
      expect(@my_list.tale.value.name).to eq("Ternera")
      expect(@my_list.tale.next).to eq(nil)
      expect(@my_list.num_elem).to eq(8)
    end  

    it 'extracting from the head' do
      extracted_node = Node.new
      extracted_node = @my_list.extract_head 
      expect(extracted_node.value.name).to eq("Salmon")
      expect(extracted_node.prev).to eq(nil)
      expect(extracted_node.next).to eq(nil)
      expect(@my_list.head.next.value.name).to eq("Bacalao")
      expect(@my_list.head.value.name).to eq("Atun")
      expect(@my_list.head.prev).to eq(nil)
      expect(@my_list.num_elem).to eq(7)
    end 
  end


  describe "#Comparable for Comida" do
    it 'do not compare Comida with a number' do
      number = 3
      expect(@huevo < number).to eq(nil)
    end

    it 'the energetic value of Huevo is bigger than the enrg.value of Leche' do
      expect(@huevo > @leche).to eq(true)
    end

    it 'EVs < or <= than others' do
      expect(@huevo <= @huevo).to eq(true)
      expect(@huevo <= @leche).to eq(false)
      expect(@leche <= @cerdo).to eq(true)
    end

   it 'EVs > or >= than others' do
      expect(@cerdo <= @cerdo).to eq(true)
      expect(@cerdo >= @leche).to eq(true)
      expect(@leche >= @cerdo).to eq(false)
    end

   it 'EVs == than others' do
      milk = Comida_clasif.new("Leche", 3.3, 4.8, 3.2, "huevos, lacteos y helados")
      newmilk = Comida_clasif.new("Leche", 3.0, 4.8, 3.2, "huevos, lacteos y helados")
      badmilk= Comida_clasif.new("BadLeche", 3.3, 4.8, 3.2, "huevos, lacteos y helados")
      expect(@huevo == @huevo).to eq(true)
      expect(@huevo == @leche).to eq(false)
      expect(@leche == milk).to eq(true)
      expect(@leche == newmilk).to eq(false)
      expect(@leche == badmilk).to eq(false)
    end
  end

  describe "#Enumerable for List" do
    before :each do
      @other_list = List.new(@leche)
      @other_list.insert_tale(nil)
      @other_list.insert_tale(@cerdo)      
    end

    it 'checking the all? method' do
      expect(@other_list.all?).to eq(false)
      expect(@my_list.all?).to eq(true)
    end 

    it 'checking the any? method' do
      expect(@other_list.any?).to eq(true)
      
      @other_list.extract_tale
      @other_list.extract_head
      expect(@other_list.any?).to eq(false)
    end 

    it 'checking the collect method' do
      @other_list.extract_tale
      @other_list.extract_tale
      @other_list.insert_tale(@cerdo)
      expect(@other_list.map{|i| i.name + "MapChecking"}).to eq(["LecheMapChecking", "CerdoMapChecking"])
      expect(@other_list.map{|i| i.name + "MapChecking"}).to eq(["LecheMapChecking", "CerdoMapChecking"])
    end 

    it 'checking the count method' do
      expect(@other_list.count).to eq(3)
    end

    it 'checking the detect method' do
      @other_list.extract_tale
      @other_list.extract_tale
      @other_list.insert_tale(@cerdo)
      expect(@other_list.detect {|i| i == @leche}).to eq(@leche)
      expect(@other_list.detect {|i| i == @ternera}).to eq(nil)
    end

    it 'checking the drop method' do
      expect(@other_list.drop(1)).to eq([nil, @cerdo])      
    end

    it 'checking the max method' do
      @other_list.extract_tale
      @other_list.extract_tale
      @other_list.insert_mto_tale([@cerdo, @yogurt, @tomate]) 
      expect(@other_list.max).to eq(@cerdo)
    end

    it 'checking the min method' do
      @other_list.extract_tale
      @other_list.extract_tale
      @other_list.insert_mto_tale([@cerdo, @yogurt, @tomate])
      expect(@other_list.min).to eq(@tomate)
    end

    it 'checking the sort method' do
      @other_list.extract_tale
      @other_list.extract_tale
      @other_list.insert_mto_tale([@cerdo, @yogurt, @tomate])
      expect(@other_list.sort).to eq([@tomate, @leche, @yogurt, @cerdo])
    end
  end
end
