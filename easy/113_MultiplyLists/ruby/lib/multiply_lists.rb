class ParseInput
  attr_reader :array1, :array2
  def initialize(string_to_parse)
    parsed_string = string_to_parse.split('|')
    @array1 = parsed_string[0].split(' ').map(&:to_i)
    @array2 = parsed_string[1].split(' ').map(&:to_i)
  end
end

class MultiplyLists
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      output = ''
      parsed_string.array1.each_with_index do |num, i|
        output += (num * parsed_string.array2[i]).to_s + ' '
      end
      puts output.rstrip
    end
  end
end

# MultiplyLists.new
