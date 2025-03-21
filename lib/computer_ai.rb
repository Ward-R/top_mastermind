
class Computer_ai
  attr_reader :guess_code, :all_guesses

  def initialize(game_instance) # pass the game_instance to this class to access live values
    @game_instance = game_instance
    @keepers_array = []
    @guess_code = []
    @all_guesses = []
    @last_guess = []
  end

  def computer_guess
    puts "turn count is #{@game_instance.turn_count}" # debug
    # If the computer has not guessed any correct digits
    if (@game_instance.red_hint_count + @game_instance.white_hint_count) == 0
      @guess_code = []
      iterator = 1 + @game_instance.turn_count
      computer_guess = Array.new(4,iterator)
      @guess_code = computer_guess
      update_all_guesses
      return @guess_code
    # If the computer has guessed 1 correct digit in any spot

    # all logic below is flawed. what if the first set to have matches is multiple? this only works for single.
    elsif (@game_instance.red_hint_count + @game_instance.white_hint_count) == 1 
      @last_guess = @guess_code
      @guess_code = []
      puts "red total #{@game_instance.red_hint_count}" #debugg
      puts "white total #{@game_instance.white_hint_count}" #debugg
      guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
      puts "guess total #{guess_total}" #debugg
      @keepers_array << @game_instance.turn_count
      iterator = 1 + @game_instance.turn_count
      puts "iterator #{iterator}"
      puts "turn count #{@game_instance.turn_count}"
      @guess_code = [@keepers_array[0], iterator, iterator, iterator]
      update_all_guesses
      puts "case hint == 1"
      puts "debug guest_code is #{@guess_code}"
      puts "debug keepers array is #{@keepers_array}"
      return @guess_code
    # If the computer has guessed 2 correct digits in any spot   
    elsif (@game_instance.red_hint_count + @game_instance.white_hint_count) == 2
      @last_guess = @guess_code
      @guess_code = []
      puts "red total #{@game_instance.red_hint_count}" #debugg
      puts "white total #{@game_instance.white_hint_count}" #debugg
      guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
      puts "guess total #{guess_total}" #debugg
      iterator = 1 + @game_instance.turn_count
      puts "iterator #{iterator}"
      puts "turn count #{@game_instance.turn_count}"
      if @keepers_array.length == 0
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
      elsif @keepers_array.length == 1
        @keepers_array << @game_instance.turn_count
      end
      @guess_code = [@keepers_array[0], @keepers_array[1], iterator, iterator]
      update_all_guesses
      puts "case hint == 2"
      puts "debug guest_code is #{@guess_code}"
      puts "debug keepers array is #{@keepers_array}"
      return @guess_code
    # If the computer has guessed 3 correct digits in any spot   
    elsif (@game_instance.red_hint_count + @game_instance.white_hint_count) == 3
      @last_guess = @guess_code
      @guess_code = []
      puts "red total #{@game_instance.red_hint_count}" #debugg
      puts "white total #{@game_instance.white_hint_count}" #debugg
      guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
      puts "guess total #{guess_total}" #debugg
      iterator = 1 + @game_instance.turn_count
      puts "iterator #{iterator}"
      puts "turn count #{@game_instance.turn_count}"
      if @keepers_array.length == 0
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
      elsif @keepers_array.length == 1
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
      elsif @keepers_array.length == 2
        @keepers_array << @game_instance.turn_count
      end
      @guess_code = [@keepers_array[0], @keepers_array[1], @keepers_array[2], iterator]
      update_all_guesses
      puts "case hint == 3"
      puts "debug guest_code is #{@guess_code}"
      puts "debug keepers array is #{@keepers_array}"
      return @guess_code
    # If the computer has guessed 4 correct digits in any spot   
    elsif (@game_instance.red_hint_count + @game_instance.white_hint_count) == 4 && @keepers_array.length != 4
      @last_guess = @guess_code
      @guess_code = []
      puts "red total #{@game_instance.red_hint_count}" #debugg
      puts "white total #{@game_instance.white_hint_count}" #debugg
      guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
      puts "guess total #{guess_total}" #debugg
      iterator = 1 + @game_instance.turn_count
      puts "iterator #{iterator}"
      puts "turn count #{@game_instance.turn_count}"
      if @keepers_array.length == 0
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
      elsif @keepers_array.length == 1
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
      elsif @keepers_array.length == 2
        @keepers_array << @game_instance.turn_count
        @keepers_array << @game_instance.turn_count
      elsif @keepers_array.length == 3
        @keepers_array << @game_instance.turn_count
      end
      @guess_code = [@keepers_array[0], @keepers_array[1], @keepers_array[2], @keepers_array[3]]
      update_all_guesses
      puts "case hint == 4"
      puts "debug guest_code is #{@guess_code}"
      puts "debug keepers array is #{@keepers_array}"
      return @guess_code
    else
      @guess_code = @keepers_array.shuffle
      puts "case hint == 4 and keeper array == 4"
      puts "debug guest_code is #{@guess_code}"
      puts "debug keepers array is #{@keepers_array}"
      update_all_guesses
      return @guess_code
    end
  end
 
  def update_all_guesses
    @all_guesses << guess_code
  end




end