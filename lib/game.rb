require_relative 'code'
require_relative 'guess'

class Game
  def initialize
    @secret_code = Code.new
    turn_count = 0
  end
  
  def play_round(guess_input)
    # game logic that uses code and guess objects
    # get secret code (done in init i think)
    while turn_count < 12
      # game logic
      
      # get user input from guess.rb
      # check for correct guess
        #if correct win game and end
        #elsif check to give hints
        #display hints
      # end round
    end
    # if 12 rounds and no correct guess, display you lose!
  end
end