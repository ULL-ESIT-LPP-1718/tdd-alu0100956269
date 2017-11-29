require 'spec_helper'
require 'benchmark'
include Benchmark
$:.unshift File.expand_path(File.dirname(__FILE__) + 'lib')


describe "#Benchmark" do
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
    @mantequilla = Comida_clasif.new("Mantequilla", 0.7, 0.0, 83.2, "alimentos grasos") 
    @chocolate = Comida_clasif.new("Chocolate", 5.3, 47.0, 30.0, "alimentos grasos")   
    @azucar = Comida_clasif.new("Azucar", 0.0, 99.8, 0.0, "alimentos ricos en carbohidratos")
    @arroz = Comida_clasif.new("Arroz", 6.8, 77.7, 0.6, "alimentos ricos en carbohidratos")
    @lentejas = Comida_clasif.new("Lentejas", 23.5, 52.0, 1.4, "alimentos ricos en carbohidratos")
    @papas = Comida_clasif.new("Papas", 2.0, 15.4, 0.1, "alimentos ricos en carbohidratos")
    @tomate = Comida_clasif.new("Tomate", 1.0, 3.5, 0.2, "verduras y hortalizas") 
    @cebolla = Comida_clasif.new("Cebolla", 1.3, 5.8, 0.3, "verduras y hortalizas")
    @calabaza = Comida_clasif.new("Calabaza", 1.1, 4.8, 0.1, "verduras y hortalizas")
    @manzana = Comida_clasif.new("Manzana", 0.3, 12.4, 0.4, "frutas")
    @platano = Comida_clasif.new("Platano", 1.2, 21.4, 0.2, "frutas")
    @pera = Comida_clasif.new("Pera", 0.5, 12.7, 0.3, "frutas")

    @my_list = List.new(@huevo)
    @my_list.insert_mto_tale([@leche, @yogurt, @cerdo, @ternera, @pollo, @bacalao, @atun, @salmon, @aceite, @mantequilla, @chocolate, @azucar, @arroz, @lentejas, @papas, @tomate, @cebolla, @calabaza, @manzana, @platano, @pera])
  end

  it 'well array begin' do
    expect(@my_list.head.value).to eq(@huevo)
    expect(@my_list.tale.value).to eq(@pera)
    expect(@my_list.num_elem).to eq(22)
  end

  it 'sorting with sort' do
    expect(@my_list.sort).to eq([@tomate, @calabaza, @cebolla, @manzana, @pera, @leche, @yogurt, @papas, @bacalao, @platano, @ternera, @pollo, @cerdo, @salmon, @atun, @huevo, @lentejas, @arroz, @azucar, @chocolate, @mantequilla, @aceite])
  end

  it 'sorting with for' do
    expect(@my_list.for_sort).to eq([@tomate, @calabaza, @cebolla, @manzana, @pera, @leche, @yogurt, @papas, @bacalao, @platano, @ternera, @pollo, @cerdo, @salmon, @atun, @huevo, @lentejas, @arroz, @azucar, @chocolate, @mantequilla, @aceite])
  end

  it 'sorting with each' do
    expect(@my_list.each_sort).to eq([@tomate, @calabaza, @cebolla, @manzana, @pera, @leche, @yogurt, @papas, @bacalao, @platano, @ternera, @pollo, @cerdo, @salmon, @atun, @huevo, @lentejas, @arroz, @azucar, @chocolate, @mantequilla, @aceite])
  end

  it 'benchmark time' do
    Benchmark.benchmark(CAPTION, 7, FORMAT, ">total:", ">avg:") do |x|
      tf1 = x.report("for: ")    {vec = @my_list.for_sort}  
      tf2 = x.report("each: ")   {vec2 = @my_list.each_sort}
      tf3 = x.report("sort: ")   {vec3 = @my_list.sort}
      [tf1+tf2+tf3, (tf1+tf2+tf3)/3]
    end
  end

end

