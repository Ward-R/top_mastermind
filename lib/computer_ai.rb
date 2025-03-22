
class Computer_ai
  attr_reader :guess_code, :all_guesses

  def initialize(game_instance, guess_object) # pass the game_instance to this class to access live values
    @game_instance = game_instance
    @guess = guess_object
    @keepers_array = []
    @guess_code = []
    @all_guesses = []
    @last_guess = [] # I dont think i used this for anything
    @guess_counter = 1
    @running_total = 0
  end

  def computer_guess
    puts "turn count is #{@game_instance.turn_count}" # debug
    # If the computer has not guessed any correct digits
    count = @game_instance.turn_count
    if count == 0
      puts "Inside turn_count == 0 block" # Debug
      computer_guess = Array.new(4, 1)
      puts "computer_guess array: #{computer_guess.inspect}" # Debug
      @guess_code = computer_guess
      puts "@guess_code: #{@guess_code.inspect}" # Debug
      update_all_guesses
      @guess_counter += 1
      #return @guess_code
    elsif @keepers_array.length < 4
      if count  == 1
        guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
        @running_total += guess_total
        guess_total.times do 
          @keepers_array << 1
        end
        # Create @guess_code with keepers_array and fill with 2s
        @guess_code = @keepers_array.dup # create a copy, so we don't modify the original keepers array.
        remaining_elements = 4 - @guess_code.length
        if remaining_elements > 0
          remaining_elements.times do
            @guess_code << 2
          end
        end
        #return @guess_code
      elsif count  == 2
        guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
        if @running_total < guess_total
          (guess_total - @running_total).times do 
            @keepers_array << 2
            @running_total = guess_total
          end
        end
        # Create @guess_code with keepers_array and fill with 2s
        @guess_code = @keepers_array.dup # create a copy, so we don't modify the original keepers array.
        remaining_elements = 4 - @guess_code.length

        if remaining_elements > 0
          remaining_elements.times do
            @guess_code << 3
          end
        end    
        check_guess_duplicate
        #return @guess_code
      elsif count  == 3
        guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
        if @running_total < guess_total
          (guess_total - @running_total).times do 
            @keepers_array << 3
            @running_total = guess_total
          end
        end
        # Create @guess_code with keepers_array and fill with 2s
        @guess_code = @keepers_array.dup # create a copy, so we don't modify the original keepers array.
        remaining_elements = 4 - @guess_code.length

        if remaining_elements > 0
          remaining_elements.times do
            @guess_code << 4
          end
        end 
        check_guess_duplicate
        #return @guess_code
      elsif count  == 4
        guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
        if @running_total < guess_total
          (guess_total - @running_total).times do 
            @keepers_array << 4
            @running_total = guess_total
          end
        end
        # Create @guess_code with keepers_array and fill with 2s
        @guess_code = @keepers_array.dup # create a copy, so we don't modify the original keepers array.
        remaining_elements = 4 - @guess_code.length

        if remaining_elements > 0
          remaining_elements.times do
            @guess_code << 5
          end
        end  
        check_guess_duplicate
        #return @guess_code
      elsif count  == 5
        guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
        if @running_total < guess_total
          (guess_total - @running_total).times do 
            @keepers_array << 5
            @running_total = guess_total
          end
        end
        # Create @guess_code with keepers_array and fill with 2s
        @guess_code = @keepers_array.dup # create a copy, so we don't modify the original keepers array.
        remaining_elements = 4 - @guess_code.length

        if remaining_elements > 0
          remaining_elements.times do
            @guess_code << 6
          end
        end  
        check_guess_duplicate
        #return @guess_code
      elsif count  == 6
        guess_total = @game_instance.red_hint_count + @game_instance.white_hint_count
        if @running_total < guess_total
          (guess_total - @running_total).times do 
            @keepers_array << 6
            @running_total = guess_total
          end
        end
        # Create @guess_code with keepers_array and fill with 2s
        @guess_code = @keepers_array.shuffle
        puts "case hint == 4 and keeper array == 4"
        puts "debug guest_code is #{@guess_code}"
        puts "debug keepers array is #{@keepers_array}"
        check_guess_duplicate
        update_all_guesses
        #return @guess_code  
      end
    else
      @guess_code = @keepers_array.shuffle
      puts "case hint == 4 and keeper array == 4"
      puts "debug guest_code is #{@guess_code}"
      puts "debug keepers array is #{@keepers_array}"
      check_guess_duplicate
      update_all_guesses
      #return @guess_code
    end
    return @guess_code
  end
 
  def update_all_guesses
    @all_guesses << guess_code
  end

  # def check_guess_duplicate
  #   puts "checking duplicate"
  #   puts "all guesses : #{@guess.all_guesses}"
  #   puts "guess code : #{@guess_code}"
  #   puts "keepers array: #{@keepers_array}"
  #   if @guess.all_guesses.include?(@guess_code)
  #     @guess_code = @keepers_array.shuffle
  #     puts "I shuffled didn't i?"
  #   end
  #   return @guess_code
  # end
  def check_guess_duplicate
    puts "checking duplicate"
    puts "all guesses : #{@guess.all_guesses}"
    puts "guess code : #{@guess_code}"
    puts "keepers array: #{@keepers_array}"
    while @guess.all_guesses.any? { |guess_with_hints| guess_with_hints[0, 4].map(&:to_i) == @guess_code }
      @guess_code = @keepers_array.shuffle
      puts "I shuffled right?"
    end
  end

end