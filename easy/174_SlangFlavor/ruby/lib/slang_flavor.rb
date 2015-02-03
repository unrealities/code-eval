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

  def initialize(string_inputs = ARGV[0])
    i = 0
    IO.foreach(string_inputs) do |line|
      output = line.strip.gsub(/[?!.]/) do |str|
        i += 1
        i = 1 if i == ( SLANGS.length * 2 + 1 )
        i.even? ? SLANGS[ i/2 - 1 ] : str
      end
      puts output
    end
  end
end

#SlangFlavor.new
