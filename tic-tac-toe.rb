class Board
  attr_reader :finished, :previous_moves, :available_moves

  def initialize
    @available_moves = [1,2,3,4,5,6,7,8,9]
    @previous_moves = []
    @victory = false
  end

  def make_move(position_number)
    @previous_moves << @available_moves.delete(position_number)
  end

  def victory
    winning_patterns = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], # Rows
      [1, 4, 7], [2, 5, 8], [3, 6, 9], # Columns
      [1, 5, 9], [3, 5, 7]             # Diagonals
    ]

    winning_patterns.each do |pattern|

      last_player_moves = @previous_moves.length.odd? ? @previous_moves.select.with_index { |_, index| index.even? } : @previous_moves.select.with_index { |_, index| index.odd? }
      if (pattern - last_player_moves).empty?
        @victory = true
      end
    end

    false
  end

  def display_board
    board = Array.new(3) { Array.new(3, ' ') }

    @previous_moves.each_with_index do |cell, index|
      row = (cell - 1) / 3
      col = (cell - 1) % 3
      board[row][col] = (index.even? ? 'X' : 'O') if index < 9
    end

    board.each_with_index do |row, row_index|
      puts "  #{row[0]} | #{row[1]} | #{row[2]} "
      puts " ---|---|---" unless row_index == 2
    end
  end
end


class Game
  def initialize(player_1_name, player_2_name)
    @player_1 = player_1_name
    @player_2 = player_2_name
    @board = Board.new
    start
  end


  def start
    until @board.victory || @board.available_moves.length == 0
      @board.previous_moves.length.even? ? p('Player 1 turn') : p('Player 2 turn')
      play = gets.chomp.to_i
      if @board.available_moves.include? play
        @board.make_move play
        @board.display_board
        @board.victory
      else
        p "Invalid move, the available moves are #{@board.available_moves.to_s}"
      end
    end

    if @board.victory
      winner = @board.previous_moves.length.odd? ? @player_1 : @player_2
      p "The winner is: #{winner}!"
    else
      p "The game ends in a draw!"
    end
  end

end



newGame = Game.new('Anthony', 'Sebastian')
