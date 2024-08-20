

require_relative "player.rb"
require_relative "board.rb"

include BoardModule
include PlayerModule


module GameModule
  class Game
    def initialize(player_1_name, player_2_name)
      @player_1 = Player.new(player_1_name, 'X')
      @player_2 = Player.new(player_2_name, 'O')
      @board = Board.new
      start
    end
  
  
    def start
      current_player = @player_1
  
      until @board.last_player_won || @board.available_moves.length == 0
        p "#{current_player.name}'s turn (#{current_player.symbol})"
        play = gets.chomp.to_i
        if @board.available_moves.include? play
          @board.make_move play
          @board.display_board
          @board.is_winning_move
          current_player = next_player(current_player)
        else
          p "Invalid move, the available moves are #{@board.available_moves.to_s}"
        end
      end
  
      if @board.last_player_won
        winner = current_player == @player_1 ? @player_2.name : @player_1.name
        p "The winner is: #{winner}!"
      else
        p "The game ends in a draw!"
      end
    end
  
    private
  
    def next_player(current_player)
      current_player == @player_1 ? @player_2 : @player_1
    end
  end
end
