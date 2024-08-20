module BoardModule
  class Board
    attr_reader :last_player_won, :previous_moves, :available_moves
  
    def initialize
      @available_moves = (1..9).to_a
      @previous_moves = []
      @last_player_won = false
    end
  
    def make_move(position_number)
      @previous_moves << @available_moves.delete(position_number)
    end
  
    def is_winning_move
      winning_patterns = [
        [1, 2, 3], [4, 5, 6], [7, 8, 9], # Rows
        [1, 4, 7], [2, 5, 8], [3, 6, 9], # Columns
        [1, 5, 9], [3, 5, 7]             # Diagonals
      ]
  
      first_player_moved_last = @previous_moves.length.even?
      last_player_moves = @previous_moves.filter do |play|
        index = @previous_moves.find_index(play)
        first_player_moved_last ? index.odd? : index.even?
      end
  
      winning_patterns.each do |pattern|
        if (pattern - last_player_moves).empty?
          @last_player_won = true
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
end

