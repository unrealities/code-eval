class CalcReverseAndAdd
  def initialize(num)
    @num = num
    @i = 0
    while !palindrome? do
      @i += 1
      @num += reverse_num
    end
  end

  def to_s
    "#{@i} #{@num}"
  end

  private
  
  def reverse_num
    @num.to_s.reverse.to_i
  end

  def palindrome?
    @num == reverse_num
  end
end

class ReverseAndAdd
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts CalcReverseAndAdd.new(line.strip.to_i).to_s
    end
  end
end

# ReverseAndAdd.new
