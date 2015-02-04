class ReadMore
  MAX_LENGTH = 55
  TRIM_LENGTH = 40
  READ_MORE = '... <Read More>'

  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      clean_line = line.strip
      if clean_line.length > MAX_LENGTH
        trimmed_string = clean_line[0..TRIM_LENGTH-1]
        trimmed_string = cleanup_spaces(trimmed_string)
        puts trimmed_string + READ_MORE
      else
        puts clean_line
      end
    end
  end
  
  private
  
  def cleanup_spaces(str)
    if str.include? ' '
      str.slice(/.* /).rstrip
    else
      str
    end
  end
end

ReadMore.new
