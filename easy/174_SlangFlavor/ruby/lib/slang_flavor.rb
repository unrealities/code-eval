class ParseInput
  def initialize(string_to_parse)
    @parsed_string = string_to_parse
  end
end

class SlangFlavor
  SLANGS = [
    ', yeah!',
    ', this is crazy, I tell ya.',
    ', can U believe this?',
    ', eh?',
    ', aw yea.',
    ', yo.',
    '? No way!',
    '. Awesome!'
  ]
  PUNCTUATIONS = %w{. ! ?}

  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_string = ParseInput.new(line.strip)
      # do work
    end
  end
end

# SlangFlavor.new
