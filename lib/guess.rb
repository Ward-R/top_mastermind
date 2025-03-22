class Guess
  attr_reader :guess_code, :all_guesses

  def initialize
    @guess_code = []
    @all_guesses = []
  end
  #get user input and store as guess
  def get_guess
    loop do
      @guess_code = []
      print "Enter four single digit numbers between 1-6 (e.g., 1123): "
      input = gets.chomp
  
      if input =~ /^[1-6]{4}$/ # Check if the input is 4 digits between 1-6
        @guess_code = input.split("").map(&:to_i) # Convert the string to an array of integers
        update_all_guesses
        return @guess_code
      else
        puts "Error: Please enter exactly four numbers between 1-6 (e.g., 1123)."
      end
    end
  end

  def update_all_guesses
    @all_guesses << guess_code
  end

end
