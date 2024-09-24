module PlayerModule
  class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end

    def play(board, position_number)
      if board.available_moves.include?(position_number)
        board.make_move(position_number)
        board.display_board
        true
      else
        false
      end
    end
  end
end
