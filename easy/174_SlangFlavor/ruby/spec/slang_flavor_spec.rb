require_relative 'spec_helper'

RSpec.describe SlangFlavor do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      SlangFlavor.new('../test_input.txt')
      expect($stdout.string).to match('Lorem ipsum dolor sit amet. Mea et habeo doming praesent, yeah! Te inani utroque recteque has, sea ne fugit verterem!')
      expect($stdout.string).to match('Usu ei scripta phaedrum, an sed salutatus definiebas, this is crazy, I tell ya. Qui ut recteque gloriatur reformidans. Qui solum aeque sapientem cu, can U believe this?')
      expect($stdout.string).to match('Eu nam nusquam quaestio principes.')
    end
  end
end
