class CalcDecodeNumbers
  attr_reader :count
  def initialize(input)
    @input = input
    @num_array = @input.split('')
    @possibilities = possibilities
    @combinations = combinations
  end

  def count
    count = 0
    @combinations.each do |c|
      if c.join('') == @input
        count +=1
      end
    end
    count
  end
  
  private

  def combinations
    combinations = Array.new
    for n in 1..@num_array.length
      combinations += @possibilities.combination(n).to_a.uniq
    end
    combinations
  end

  def possibilities
    possibilities = Array.new(1) { @num_array[0] }
    return possibilities if @num_array.length == 1

    for i in 0..@num_array.length-2
      two_digit = @num_array[i] + @num_array[i+1]
      possibilities << @num_array[i+1]
      possibilities << two_digit if two_digit.to_i < 27
    end

    possibilities << @num_array[i]
  end
end

class DecodeNumbers
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts CalcDecodeNumbers.new(line.strip).count
    end
  end
end

# DecodeNumbers.new