class Code
  attr_reader :secret_code

  def initialize
    @secret_code = computer_secret_code
  end
  # have computer create a secret code and store it.
  def computer_secret_code
    secret_code = []
    4.times do |i|
      secret_code[i] = rand(1..6)
    end
    return secret_code
  end

  def player_secret_code #haven't tested this yet
    secret_code = []
    print "Enter secret code consisting of four single digit numbers between 1-6 (e.g., 1123):" # should add data entry validation
    input = gets.chomp
    secret_code = input.split("")
    #guess_array <= get_input
    if secret_code.length != 4
      puts "Error: Please enter exactly four values."
      return nil
    end
    secret_code.map!(&:to_i)
    return secret_code
  end
end