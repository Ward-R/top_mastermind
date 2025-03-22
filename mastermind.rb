require_relative 'lib/game'

#update this to reflect new roles between human and computer.
puts "Welcome to mastermind. one player makes a secret code of 4 digits each between 1-6. eg. 3226. Consecutive numbers may be used."
puts "The other player will try to guess the combination in 12 turns"
puts "If a player guesses a correct number in the correct location it will give a red hint 1R0W for each number in the correct location."
puts "If a player guesses a correct number in the wrong location it will give a white hint 0R1W for each number in the wrong location"
puts "This game is Human vs. the Computer. You can either be the code maker or the code breaker"
puts "Good Luck!"
game = Game.new
game.play_round