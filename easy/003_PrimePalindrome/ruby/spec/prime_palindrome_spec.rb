require_relative 'spec_helper'

RSpec.describe 'PrimePalindrome' do
  before do
    $stdout = StringIO.new
  end

  after(:all) do
    $stdout = STDOUT
  end

  describe '#initialize' do
    it 'should return correct test outputs given test input' do
      puts max_palindrome_prime_less_than 1000
      expect($stdout.string).to match('929')
    end
  end
end
