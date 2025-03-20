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

  # def check_for_win(colour_guess)
  #   secret_values = @secret_hash.values
  #   hint_array =[] #will need to pass this to board and create update logic
  #   if secret_values == colour_guess
  #     @turn_count = 12
  #     puts "You Win!"
  #   else
  #     secret_values.each_with_index do |colour, index|
  #       if colour_guess[index] == secret_values[index]
  #         hint_array << "r"
  #       elsif colour_guess[index] != secret_values[index] && colour_guess[index] == secret_values.any?
  #         hint_array << "w"
  #       end
  #     end
  #   end
  #   puts hint_array
  # end
  def check_for_win(colour_guess)
    secret_values = @secret_hash.values
    hint_array = []
    if secret_values == colour_guess
      @turn_count = 12
      puts "You Win!"
    else
      secret_values_copy = secret_values.dup # Create a copy to avoid modifying the original
      colour_guess.each_with_index do |colour, index|
        if colour == secret_values_copy[index]
          hint_array << "r"
          secret_values_copy[index] = nil # Mark as matched
          colour_guess[index] = nil #mark as matched
        end
      end
  
      colour_guess.each_with_index do |colour, index|
        if colour && secret_values_copy.include?(colour)
          hint_array << "w"
          secret_values_copy[secret_values_copy.index(colour)] = nil # Mark as matched
        end
      end
    end
    puts hint_array
  end

  def check_for_hints
  end

  def play_turn
    guess = @player.get_guess
    colour_guess = @player.convert_to_colours(guess, @board.colours)
    if colour_guess
      @player.update_guess_array(colour_guess)
      if @player.guess_array && @player.guess_array.length > (@turn_count || 0) # Use || 0 to default to 0
        hint_array = check_for_win(colour_guess)
        @board.update_board_array(@player.guess_array[@turn_count], @turn_count, hint_array)
        @turn_count += 1
      end
      check_for_win(colour_guess)
      #check for win condition here. 
      #if not a win update hints
    end
  end

end
