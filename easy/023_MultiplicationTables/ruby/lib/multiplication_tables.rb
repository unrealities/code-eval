class MultiplicationTables
  def initialize(max, spaces)
    @max = max
    @spaces = spaces
  end
  
  def to_s
    output = ''
    for current_row in 1..@max
      for current_column in 1..@max do
        current_multiple = current_row * current_column
        output += "%0#{@spaces}s" % current_multiple
      end
      puts output.lstrip
      output = ''
    end
  end
end

MultiplicationTables.new(12, 4).to_s
