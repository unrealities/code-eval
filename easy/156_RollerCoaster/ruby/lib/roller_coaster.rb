class RollerCoaster
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      parsed_array = line.strip.split('')
      i = 0
      parsed_array.map! do |str|
        if str =~ /[[:alpha:]]/
          i += 1
          i.odd? ? str.upcase : str.downcase
        else
          str
        end
      end
      puts parsed_array.join('')
    end
  end
end

# RollerCoaster.new
