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
      # break fast and account for odd test case
      if row.scan('XY').count == 1
        spaces = 0
        break
      else
        empty_spaces = row.scan('.').count
        spaces = empty_spaces if empty_spaces < spaces
      end
    end
    spaces
  end
end

# Details.new
