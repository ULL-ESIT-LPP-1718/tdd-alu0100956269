require 'spec_helper'
require 'minitest/autorun'
require 'minitest/spec'
$:.unshift File.expand_path(File.dirname(__FILE__) + 'lib')
require 'Alimento/Comida.rb'

describe Alimento do
  before :all do
    @huevo = Comida.new("Huevo")
  end

  it 'has a version number' do
    expect(Alimento::VERSION).not_to be nil
  end

  it 'has a name' do
    expect(@huevo.name).to eq("Huevo")
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
