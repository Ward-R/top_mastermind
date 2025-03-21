require_relative 'lib/game'


puts "Welcome to mastermind. You will try to guess 4 numbers between 1-6. Consecutive numbers may be used."
puts "If you guess a correct number in the correct location it will give a red hint 1R0W for each number in the correct location."
puts "If you guess a correct number in the wrong location it will give a white hint 0R1W for each number in the wrong location"
puts "You have 12 turns to guess the code, good luck!"
game = Game.new
game.play_round