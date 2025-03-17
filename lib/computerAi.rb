require_relative "board.rb"


class ComputerAi
  attr_reader :secret_hash
  def initialize(board)
    @board = board # This stores the board passed from Board.rb to main.rb to here.

  end
  
  def random_number
    rand(1..6) # Generate from 1-6
  end

  def generate_secret # Generates secret to be solved and stores as hash. Can have multiple colours the same.
    @secret_hash = {}
    4.times do |i|
      @secret_hash[i] = @board.colours[random_number]
    end
    @secret_hash
  end
end
