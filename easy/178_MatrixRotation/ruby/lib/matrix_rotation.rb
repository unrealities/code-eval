class SquareMatrix
  attr_reader :dim

  def initialize(initial_values)
    init_array_representation = initial_values.split(' ')
    @dim = Math.sqrt(init_array_representation.length).to_i
    @matrix = matrix(init_array_representation)
  end
  
  def matrix(array_representation)
    matrix = Array.new(@dim) { Array.new(@dim)}
    array_index = -1
    for col_index in 0..( @dim - 1 ) do
      for row_index in 0..( @dim - 1 ) do
        array_index += 1
        matrix[col_index][row_index] = array_representation[array_index]
      end
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
    for col_index in 0..( @dim - 1 ) do
      for row_index in 0..( @dim - 1 ) do
        output += @matrix[col_index][row_index] + ' '
      end
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
