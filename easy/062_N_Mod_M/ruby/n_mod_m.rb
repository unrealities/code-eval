class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def numerator
    @string_to_parse.split(",")[0]
  end

  def denominator
    @string_to_parse.split(",")[1]
  end
end

class Mod
  def initialize(numerator, denominator)
    @numerator = numerator.to_i
    @denominator = denominator.to_i
  end
  def remainder
    division = @numerator / @denominator
    largest_equal = division*@denominator
    @numerator - largest_equal
  end
end

class NModM
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      mod = Mod.new(parsed_string.numerator, parsed_string.denominator)
      puts mod.remainder
    end
  end
end

NModM.new