class CalcKnightMoves
  COLUMNS = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  ROWS = ['1', '2', '3', '4', '5', '6', '7', '8']
  POSSIBILITIES = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                   [1, 2], [1, -2], [-1, 2], [-1, -2]]
  
  def initialize(current_position)
    @column = current_position[0]
    @row = current_position[1]
    @possible_moves = self.possible_moves
  end
  
  def possible_moves
    possible_moves = Array.new(POSSIBILITIES.length)
    possible_moves.each_index do |possible_move|
      possible_moves[possible_move] =
        move(COLUMNS, @column, POSSIBILITIES[possible_move][0]) +
        move(ROWS, @row, POSSIBILITIES[possible_move][1])
    end
    remove_invalid_moves(possible_moves)
  end
  
  def to_s
    output = ""
    sorted_moves = @possible_moves.sort
    sorted_moves.each do |move|
      output += (move + ' ')
    end
    output.rstrip
  end
  
  private

  def move(direction, position, i)
    new_position = direction.index(position) + i
    new_position > -1 && new_position < 8 ? direction[new_position] : ''
  end
  
  def remove_invalid_moves(moves_array)
    moves_array.keep_if do |move|
      move.length == 2
    end
  end
end

class KnightMoves
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      knight_moves = CalcKnightMoves.new(line.strip)
      puts knight_moves.to_s
    end
  end
end

# KnightMoves.new
