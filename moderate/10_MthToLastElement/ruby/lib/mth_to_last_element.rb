class MthToLastElement
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_input = line.strip.split(' ')
      last_index = parsed_input[-1].to_i
      puts parsed_input[0..-2][-last_index]
    end
  end
end

# MthToLastElement.new
