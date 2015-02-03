class WithoutRepetitions
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      string_array = line.strip.split('')
      i = 0
      while i < string_array.length do
        if string_array[i] == string_array[i+1]
          string_array.delete_at(i+1)
          i -= 1
        end
        i += 1
      end
      puts string_array.join('')
    end
  end
end

WithoutRepetitions.new
