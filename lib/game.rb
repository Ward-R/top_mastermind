require_relative 'code'
require_relative 'guess'

class Game
  
  def initialize
    @code = Code.new
    @secret_code = @code.secret_code
    @guess = Guess.new
    @turn_count = 0
    @red_hint_count = 0
    @white_hint_count = 0
  end
  
  def check_for_win
    if @secret_code == @turn_guess
      puts "You Win! Secret number was #{@secret_code}"
      @turn_count = 12
    end
  end

  def check_for_hint
    @red_hint_count = 0
    @white_hint_count = 0
    turn_guess_copy = @turn_guess.dup # make temporary copy of turn guess
    secret_code_copy = @secret_code.dup # make temp copy
    # Check if correct number in correct spot
   
    # Ai assisted with this code block. couldn't figure it out. ;;

      # Check for "b" hints
    turn_guess_copy.each_with_index do |guess_value, guess_index|
      if guess_value == secret_code_copy[guess_index]
        @red_hint_count += 1
        turn_guess_copy[guess_index] = nil
        secret_code_copy[guess_index] = nil
      end
    end

    # Check for "w" hints
    turn_guess_copy.each_with_index do |guess_value, guess_index|
      if guess_value != nil
        secret_code_copy.each_with_index do |secret_value, secret_index|
          if guess_value == secret_value
            @white_hint_count += 1
            turn_guess_copy[guess_index] = nil
            secret_code_copy[secret_index] = nil
            break
          end
        end
      end
    end

    red_hints = "#{@red_hint_count}R"
    white_hints = "#{@white_hint_count}W"
  
    guess_with_hints = @turn_guess.map(&:to_s) + [" "] + [red_hints] + [white_hints] # Create a NEW array
    @guess.all_guesses[@turn_count] = guess_with_hints # Replace the old array
  end

  def play_round
    # game logic that uses code and guess objects
    # get secret code (done in init i think)
    # print "Secret code for debugging: #{@secret_code}\n" #debugging
    while @turn_count < 12
      # game logic
      @turn_guess = @guess.get_guess # I don't thnk this does anything useful now.
      check_for_hint
      @guess.all_guesses.each do |row|
        row.each {|cell| print cell}
        print "\n"
      end
      check_for_win
      puts ""
      @turn_count += 1
    end
    # if 12 rounds and no correct guess, display you lose!
    if @turn_count == 12
      puts "Secret number was #{@secret_code}"
      puts "You Lose! Loser! Go touch grass!"
    end
   
  end
end