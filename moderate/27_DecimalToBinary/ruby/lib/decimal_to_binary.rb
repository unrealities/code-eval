class DecimalToBinary
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts string_decimal_to_binary(line.strip)
    end
  end
  
  def string_decimal_to_binary(str)
    str.to_i.to_s(2)
  end
end

# DecimalToBinary.new
