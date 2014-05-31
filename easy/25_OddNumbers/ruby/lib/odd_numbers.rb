class OddNumbers
  def initialize
    (1..99).each do |num|
      puts num unless num % 2 == 0
    end
  end
end

#OddNumbers.new