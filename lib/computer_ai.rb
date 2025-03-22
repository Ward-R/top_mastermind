class Computer_ai
  attr_reader :guess_code, :all_guesses

  def initialize(game_instance, guess_object) # pass the game_instance to this class to access live values
    @game_instance = game_instance
    @guess = guess_object
    @keepers_array = []
    @guess_code = []
    @all_guesses = []
    @guess_counter = 1
    @running_total = 0
  end


  # This is realy primative (and overly complicated) logic. It just goes through 1111, 2222...6666, until it gets an R or W for 4 values
  # After that it just shuffles, but will not play the same number twice. In 100,000 permutations it will guess the correct number 61.2% of the time.
  def computer_guess
    # If the computer has not guessed any correct digits
    count = @game_instance.turn_count
    if count == 0
      computer_guess = Array.new(4, 1)
      @guess_code = computer_guess
      update_all_guesses
      @guess_counter += 1
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
        check_guess_duplicate
        update_all_guesses
      end
    else
      @guess_code = @keepers_array.shuffle
      check_guess_duplicate
      update_all_guesses
    end
    return @guess_code
  end
 
  def update_all_guesses
    @all_guesses << guess_code
  end

  def check_guess_duplicate
    while @guess.all_guesses.any? { |guess_with_hints| guess_with_hints[0, 4].map(&:to_i) == @guess_code }
      @guess_code = @keepers_array.shuffle
    end
  end
end