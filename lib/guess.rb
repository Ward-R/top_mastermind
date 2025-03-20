class Guess
  attr_reader :guess_code, :all_guesses

  def initialize
    @guess_code = []
    @all_guesses = []
  end
  #get user input and store as guess
  def get_guess
    @guess_code = []
    print "Enter four single digit numbers (e.g., 1123): "
    input = gets.chomp
    guess_code = @guess_code
    @guess_code = input.split("")
    #guess_array <= get_input
    if @guess_code.length != 4
      puts "Error: Please enter exactly four values."
      return nil
    end
    @guess_code.map!(&:to_i)
    update_all_guesses
    return @guess_code
  end

  def update_all_guesses
    @all_guesses << guess_code
  end

end
