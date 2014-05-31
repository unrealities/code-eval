class ParseInput
  def initialize(string_to_parse)
    @parsed_array = string_to_parse.split(",")
    @parsed_array.map!(&:to_i)
  end

  def to_binary
    @parsed_array[0].to_s(2)
  end

  def binary_indices
    [@parsed_array[1]-1, @parsed_array[2]-1]
  end
end

class BitPositions
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      @binary_string = parsed_string.to_binary
      @indices = parsed_string.binary_indices
      puts positions_eq?
    end
  end

  private

  def positions_eq?
    @binary_string.reverse[@indices[0]] == @binary_string.reverse[@indices[1]]
  end
end

#BitPositions.new