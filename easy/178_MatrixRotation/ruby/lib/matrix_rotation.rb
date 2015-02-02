class SquareMatrix
  attr_reader :dim

  def initialize(initial_values)
    init_array_representation = initial_values.split(' ')
    @dim = Math.sqrt(init_array_representation.length).to_i
    @matrix = matrix(init_array_representation)
  end
  
  def matrix(array_representation)
    matrix = Array.new(@dim) { Array.new(@dim)}
    col_index = -1
    row_index = -1
    array_index = -1
    @dim.times do
      col_index += 1
      @dim.times do
        row_index += 1
        array_index += 1
        matrix[col_index][row_index] = array_representation[array_index]
      end
      row_index = -1
    end
    matrix
  end
  
  def rotate_90_cw
    rotated_matrix = Array.new(@dim) { Array.new(@dim)}
    @matrix.each_with_index do |col, col_index|
      col.each_index do |row_index|
        rotated_row_index = col_index
        rotated_col_index = @dim - 1 - row_index
        rotated_matrix[col_index][row_index] = @matrix[rotated_col_index][rotated_row_index]
      end
    end
    @matrix = rotated_matrix
    self
  end
  
  def to_s
    output = ''
    col_index = -1
    row_index = -1
    @dim.times do
      col_index += 1
      @dim.times do
        row_index += 1
        output += @matrix[col_index][row_index] + ' '
      end
      row_index = -1
    end
    output.rstrip
  end
  
end

class MatrixRotation
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      matrix = SquareMatrix.new(line.strip)
      puts matrix.rotate_90_cw.to_s
    end
  end
end

# MatrixRotation.new
