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
game.board.print_board_selection

guess = game.player.get_guess
colour_guess = game.player.convert_to_colours(guess, game.board.colours)
puts game.player.update_guess_array(colour_guess)