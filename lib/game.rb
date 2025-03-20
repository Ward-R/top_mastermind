require_relative 'code'
require_relative 'guess'

class Game
  
  def initialize
    @code = Code.new
    @secret_code = @code.secret_code
    @guess = Guess.new
    @turn_count = 0
    @hint_array = []
  end
  
  def check_for_win
    if @secret_code == @turn_guess
      @turn_count = 12
      puts "You Win!"
    end
  end

  def check_for_hint
    @hint_array = []
    turn_guess_copy = @turn_guess.dup # make temporary copy of turn guess
    # Check if correct number in correct spot
    @secret_code.each_with_index do |value, index|
      if value == turn_guess_copy[index]
        @hint_array << "b" # mark correct number, correct location
        @guess.all_guesses[@turn_count - 1] << "b"
        turn_guess_copy[index] = nil # mark as matched
      end
    end
    # check remaining guesses for correct numbers in wrong spot
    turn_guess_copy.each_with_index do |value, index|
      if @secret_code.include?(value)
        @hint_array << "w" # mark correct number, wrong location
        turn_guess_copy[index] = nil # mark as matched
      end
    end
  end

  def play_round
    # game logic that uses code and guess objects
    # get secret code (done in init i think)
    print "Secret code for debugging: #{@secret_code}\n" #debugging
    while @turn_count < 12
      # game logic
      @turn_guess = @guess.get_guess # I don't thnk this does anything useful now.
      check_for_win
      check_for_hint
      @guess.all_guesses.each do |row|
        row.each {|cell| print cell}
        print "\n"
      end
      #print @turn_guess
      puts ""
      @turn_count += 1
    end
    #p @guess.all_guesses
    puts ""
    # if 12 rounds and no correct guess, display you lose!
  end
end