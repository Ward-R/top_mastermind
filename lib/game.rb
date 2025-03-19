require_relative "board.rb"
require_relative "player.rb"

class Game
  attr_reader :secret_hash, :board, :player, :turn_count
  def initialize
    @board = Board.new # This stores the board passed from Board.rb to main.rb to here.
    @player = Player.new
    @turn_count = 0
  end
  
  def random_number
    rand(1..6) # Generate from 1-6
  end

  def generate_secret # Generates secret to be solved and stores as hash. Can have multiple colours the same.
    @secret_hash = {}
    4.times do |i|
      @secret_hash[i] = @board.colours[random_number]
    end
    @secret_hash
  end

  def play_turn
    guess = @player.get_guess
    colour_guess = @player.convert_to_colours(guess, @board.colours)
    if colour_guess
      @player.update_guess_array(colour_guess)
      if @player.guess_array && @player.guess_array.length > (@turn_count || 0) # Use || 0 to default to 0
        @board.update_board_array(@player.guess_array[@turn_count], @turn_count)
        @turn_count += 1
      end
    end
  end

end
