require_relative 'spec_helper'

RSpec.describe ParseInput do
  let(:parse_input) { ParseInput.new('a b c d') }

end

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
      expect($stdout.string).to match('Lorem ipsum dolor sit amet. Mea et habeo doming praesent, yeah! Te')
      expect($stdout.string).to match('inani utroque recteque has, sea ne fugit verterem!')
      expect($stdout.string).to match('Usu ei scripta phaedrum, an sed salutatus definiebas, this is
crazy, I tell ya. Qui ut recteque gloriatur reformidans. Qui solum')
      expect($stdout.string).to match('aeque sapientem cu, can U believe this?')
      expect($stdout.string).to match('Eu nam nusquam quaestio principes.')
    end
  end
end
