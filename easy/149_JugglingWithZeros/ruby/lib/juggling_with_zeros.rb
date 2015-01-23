class JugglingWithZeros
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts array_to_binary_string(line.strip.split(" ")).to_i(2)
    end
  end
  
  def array_to_binary_string(arr)
    str = ""
    arr.each_index do |zero_str_index|
      if zero_str_index.even?
        str += to_binary_value(arr[zero_str_index]) * arr[zero_str_index + 1].length
      end
    end
    str
  end
  
private
  
  def to_binary_value(str)
    str == "00" ? '1' : '0'
  end
end

#JugglingWithZeros.new
