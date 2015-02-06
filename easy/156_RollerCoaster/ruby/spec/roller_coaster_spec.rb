require_relative 'spec_helper'

RSpec.describe RollerCoaster do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      RollerCoaster.new('../test_input.txt')
      expect($stdout.string).to match('To Be, Or NoT tO bE: tHaT iS tHe QuEsTiOn.')
      expect($stdout.string).to match('WhEtHeR \'tIs NoBlEr In ThE mInD tO sUfFeR.')
      expect($stdout.string).to match('ThE sLiNgS aNd ArRoWs Of OuTrAgEoUs FoRtUnE.')
      expect($stdout.string).to match('Or To TaKe ArMs AgAiNsT a SeA oF tRoUbLeS.')
      expect($stdout.string).to match('AnD bY oPpOsInG eNd ThEm, To DiE: tO sLeEp.')
    end
  end
end
