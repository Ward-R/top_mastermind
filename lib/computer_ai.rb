
class Computer_ai
  attr_reader :guess_code, :all_guesses

  def initialize(game_instance)
    @turn_count = game_instance.turn_count
    @keepers_array = []
    red_hints = game_instance.red_hint_count
    white_hints = game_instance.white_hint_count
    @guess_code = []
    @all_guesses = []
  end

  def computer_guess
    if @turn_count == 1
      @guess_code = []
      random_number = rand(1111..6666).to_s.split("").map(&:to_i)
      @guess_code = random_number
      update_all_guesses
      return @guess_code
      #set guess to 1111
    
    # for furthur rounds
    # if previous round had any R or W keep that number of digits. e.g. if it had 1R1W, keep two 1's - add to keepers_array?
    # for turn_count == 2 
    # 1122 if any 
    else
      @guess_code = []
      random_number = rand(1111..6666).to_s.split("").map(&:to_i)
      @guess_code = random_number
      update_all_guesses
      return @guess_code
    end
  end
    #get user input and store as guess human turn code below for reference
  # def get_guess
  #   @guess_code = []
  #   print "Enter four single digit numbers between 1-6 (e.g., 1123):" # should add data entry validation
  #   input = gets.chomp
  #   guess_code = @guess_code
  #   @guess_code = input.split("")
  #   #guess_array <= get_input
  #   if @guess_code.length != 4
  #     puts "Error: Please enter exactly four values."
  #     return nil
  #   end
  #   @guess_code.map!(&:to_i)
  #   update_all_guesses
  #   return @guess_code
  # end

  def update_all_guesses
    @all_guesses << guess_code
  end




end