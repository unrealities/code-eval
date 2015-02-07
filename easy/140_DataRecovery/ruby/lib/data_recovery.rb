class ParseInput
  attr_reader :words
  def initialize(string_to_parse)
    @split_array = string_to_parse.split(';')
    @words = @split_array[0].split(' ')
  end
  
  def positions
    positions = @split_array[1].split(' ').map(&:to_i)
    for i in 1..positions.length + 1
      unless positions.include? i
        positions << i
        break
      end
    end
    positions
  end
end

class CalcDataRecovery
  def initialize(words, positions)
    @words = words
    @positions = positions
  end
  
  def order
    ordered_array = Array.new(@words.length)
    ordered_array.each_index do |i|
      ordered_array[i] = @words[@positions.index(i + 1)]
    end
    ordered_array
  end
  
  def to_s
    order.join(' ')
  end
end

class DataRecovery
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      puts CalcDataRecovery.new(parsed_string.words, parsed_string.positions).to_s
    end
  end
end

# DataRecovery.new
