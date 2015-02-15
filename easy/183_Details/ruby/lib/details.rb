class Details
  def initialize(string_inputs = ARGV[0])
    IO.foreach(string_inputs) do |line|
      details_board = line.strip.split(',')
      p spaces_to_move(details_board)
    end
  end

  def spaces_to_move(details_board)
    spaces = details_board[0].length
    details_board.each do |row|
      empty_spaces = row.scan('.').count
      spaces = empty_spaces if empty_spaces < spaces
    end
    spaces
  end
end

# Details.new
