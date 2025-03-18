require_relative("board.rb")
#require_relative("computerAi.rb")
require_relative("game.rb")
#require_relative("player.rb")
 

board = Board.new #create new instance of game board
board.print_board_selection
#board.print_empty_board

game = Game.new(board) # pass the instance of board above to computerAi
game.generate_secret
puts game.secret_hash # debug to check output

board.print_updated_board