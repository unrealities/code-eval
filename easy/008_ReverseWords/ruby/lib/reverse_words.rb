class ReverseWords
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      puts line.split(" ").reverse.join(" ")
    end
  end
end

# ReverseWords.new
