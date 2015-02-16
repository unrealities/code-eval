class TrailingStrings
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      str_array = line.strip.split(',')
      puts str_array[0][-str_array[1].length..-1] == str_array[1] ? 1 : 0
    end
  end
end

# TrailingStrings.new
