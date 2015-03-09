class Lowercase
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      # do work
    end
  end
end

# Lowercase.new
