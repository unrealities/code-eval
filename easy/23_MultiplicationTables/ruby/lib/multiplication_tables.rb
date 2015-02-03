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
        output += print_num(current_multiple)
      end
      puts output.lstrip
      output = ''
    end
  end
  
  private
  
  def print_num(num)
    num_string = num.to_s
    num_length = num_string.length
    output = ''
    (@spaces - num_length).times do
      output += ' '
    end
    output + num_string
  end
end

MultiplicationTables.new(12, 4).to_s
