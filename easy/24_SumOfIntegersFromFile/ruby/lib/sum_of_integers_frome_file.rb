class SumOfIntegersFromFile
  def initialize(string_inputs = ARGV[0])
    sum = 0
    IO.foreach(string_inputs) do |line|
      sum += line.to_i
    end
    puts sum
  end
end

#SumOfIntegersFromFile.new