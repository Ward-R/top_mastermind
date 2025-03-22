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
   
      # Check for "R" hints (correct digit, correct spot)
    turn_guess_copy.each_with_index do |guess_value, guess_index|
      if guess_value == secret_code_copy[guess_index]
        @red_hint_count += 1
        turn_guess_copy[guess_index] = nil
        secret_code_copy[guess_index] = nil
      end
    end

    # Check for "W" hints (correct digit, wrong spot)
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
    loop do
      puts "Do you want to be the guesser or the code maker? The computer will play the other role."
      puts "Enter 1 for guesser, 2 for code maker."
      choice = gets.chomp
      if choice =~ /^[1-2]{1}$/ # Check if the input is 4 digits between 1-6
        if choice == "1"
          @player_guesser = true
          @secret_code = @code.secret_code
          break
        elsif choice == "2"
          @player_guesser = false
          @secret_code = @code.player_secret_code
          break
        end
      else
        puts "Error: Please enter exactly 1 or 2"
      end
    end
    return @player_guesser
  end

  def play_round
    role_choice
    while @turn_count < 12
      if @player_guesser == true
        # game logic
        @turn_guess = @guess.get_guess 
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
          puts "Computer dumb, couldn't guess in time!"
        end
      end
    end
  end
end