class ParseInput
  attr_reader :num_array, :alpha_array
  def initialize(str)
    split_array = str.split(" ")
    @num_array = split_array[0].split("").map(&:to_i)
    @alpha_array = split_array[1].split("")
  end
end

class SplitTheNumber
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      @num_array = parsed_string.num_array
      @alpha_array = parsed_string.alpha_array
      split_the_num
    end
  end

  def split_the_num
    @alpha_array.each_index do |a|
      if @alpha_array[a].match(/-/)
        puts first_num(a) - second_num(a)
        break
      elsif @alpha_array[a].match(/\+/)
        puts first_num(a) + second_num(a)
        break
      end
    end
  end
  
  private
  
  def first_num(index)
    @num_array[0..index-1].join('').to_i
  end
  
  def second_num(index)
    @num_array[index..-1].join('').to_i
  end
end

# SplitTheNumber.new
