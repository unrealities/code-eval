class UniqueElements
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      array = line.strip.split(",")
      array.uniq!
      puts array.join(",")
    end
  end
end

#UniqueElements.new