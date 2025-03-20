require_relative("board.rb")
require_relative("game.rb")
#require_relative("player.rb")
 

# board = Board.new #create new instance of game board

#board.print_empty_board

game = Game.new # pass the instance of board above to computerAi

# methods below are to just test stuff
game.generate_secret
puts game.secret_hash # debug to check output

game.board.print_updated_board
#game.board.print_board_selection

#this turn stuff should be refactored to game.rb eventually
# guess = game.player.get_guess
# colour_guess = game.player.convert_to_colours(guess, game.board.colours)
# puts game.player.update_guess_array(colour_guess)


#game.play_turn # Call play_turn from game.rb

# Game loop
while game.turn_count < 12 # Limit to 12 turns
  game.play_turn
  # Add win/lose condition checks here
  # if game.won?
  #   puts "You won!"
  #   break
  # elsif game.lost?
  #   puts "You lost!"
  #   break
  # end
end

puts "Game over!"