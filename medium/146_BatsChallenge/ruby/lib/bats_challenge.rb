class ParseInput
  attr_reader :length_of_wire, :distance_between_bats, :init_bats
  def initialize(string_to_parse)
    array_of_ints = string_to_parse.split(' ').map(&:to_i)
    @length_of_wire = array_of_ints[0]
    @distance_between_bats = array_of_ints[1]
    @init_bats = array_of_ints[2..-1]
  end
end

class BatsChallenge
  DISTANCE_BETWEEN_BUILDINGS = 6
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      @parsed_string = ParseInput.new(line.strip)

    end
  end
end

# BatsChallenge.new
