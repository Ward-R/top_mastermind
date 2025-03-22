require_relative 'code'
require_relative 'guess'
require_relative 'computer_ai'

class Game
  attr_reader :turn_count, :red_hint_count, :white_hint_count

  def initialize
    @code = Code.new
    
    @guess = Guess.new
    @computer_ai = Computer_ai.new(self, @guess)
    @turn_count = 0
    @red_hint_count = 0
    @white_hint_count = 0
    @player_guesser = nil
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

  def role_choice
    puts "Do you want to be the guesser or the code maker? The computer will play the other role."
    puts "Enter 1 for guesser, 2 for code maker."
    choice = gets.chomp.to_i
    if choice == 1
      @player_guesser = true
      @secret_code = @code.secret_code
    elsif choice == 2
      @player_guesser = false
      @secret_code = @code.player_secret_code
    end
    return @player_guesser
  end

  def play_round
    # game logic that uses code and guess objects
    # get secret code (done in init i think)
    # print "Secret code for debugging: #{@secret_code}\n" #debugging
    role_choice
    while @turn_count < 12
      if @player_guesser == true
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
        
        # if 12 rounds and no correct guess, display you lose!
        if @turn_count == 12
          puts "Secret number was #{@secret_code}"
          puts "You Lose! Loser! Go touch grass!"
        end

      elsif @player_guesser == false # computer is guesser
        # automated computer logic
        @turn_guess = @computer_ai.computer_guess
        puts "Computer guess is #{@turn_guess}"
        check_for_hint
        @guess.all_guesses.each do |row|
          row.each {|cell| print cell}
          print "\n"
        end
        check_for_win
        puts ""
        @turn_count += 1
        sleep(1)
        
        # if 12 rounds and no correct guess, display you lose!
        if @turn_count == 12
          puts "Secret number was #{@secret_code}"
          puts "You Lose! Loser! Go touch grass!"
        end
      end
    end
  end
end