class NumberOfOnes
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      @bit_string = line.strip.to_i.to_s(2)
      puts num_of_ones
    end
  end
  
  def num_of_ones
    num_of_ones = 0
    @bit_string.each_char do |bit|
      num_of_ones += 1 if bit.match('1')
    end
    num_of_ones
  end
end

# NumberOfOnes.new
