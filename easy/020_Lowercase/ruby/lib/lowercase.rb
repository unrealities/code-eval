class Lowercase
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts line.strip.downcase
    end
  end
end

# Lowercase.new
