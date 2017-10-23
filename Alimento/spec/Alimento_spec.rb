require 'spec_helper'
require 'minitest/autorun'
require 'minitest/spec'
$:.unshift File.expand_path(File.dirname(__FILE__) + 'lib')
require 'Alimento/Comida.rb'

describe Alimento do
  before :all do
    @huevo = Comida.new("Huevo", 14.1, 0.0, 19.5)
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

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
