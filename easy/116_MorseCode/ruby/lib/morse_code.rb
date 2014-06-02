class ParseInput
  def initialize(string_to_parse)
    @string_to_parse = string_to_parse
  end

  def to_a_with_spaces
    custom_string = @string_to_parse.gsub(/  /, ' | ')
    new_array = custom_string.split(" ")
    new_array.map! do |value|
      value = " " if value == "|"
      value
    end
  end
end

class ConvertArray
  MORSE_CODE_HASH = {
                      "A" => ".-",
                      "B" => "-...",
                      "C" => "-.-.",
                      "D" => "-..",
                      "E" => ".",
                      "F" => "..-.",
                      "G" => "--.",
                      "H" => "....",
                      "I" => "..",
                      "J" => ".---",
                      "K" => "-.-",
                      "L" => ".-..",
                      "M" => "--",
                      "N" => "-.",
                      "O" => "---",
                      "P" => ".--.",
                      "Q" => "--.-",
                      "R" => ".-.",
                      "S" => "...",
                      "T" => "-",
                      "U" => "..-",
                      "V" => "...-",
                      "W" => ".--",
                      "X" => "-..-",
                      "Y" => "-.--",
                      "Z" => "--..",
                      " " => " ",
                      "1" => ".----",
                      "2" => "..---",
                      "3" => "...--",
                      "4" => "....-",
                      "5" => ".....",
                      "6" => "-....",
                      "7" => "--...",
                      "8" => "---..",
                      "9" => "----.",
                      "0" => "-----"
                    }

  def initialize(array_to_convert)
    @array_to_convert = array_to_convert
  end

  def to_morss_code
    @array_to_convert.map! do |code|
      code = MORSE_CODE_HASH.key(code)
    end
  end
end

class MorseCode
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      converted_array = ConvertArray.new(parsed_string.to_a_with_spaces)
      puts converted_array.to_morss_code.join
    end
  end
end

#MorseCode.new