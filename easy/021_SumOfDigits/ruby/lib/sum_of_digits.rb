class SumOfDigits
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts line.strip.split("").map(&:to_i).reduce(:+)
    end
  end
end

# SumOfDigits.new
