

class Player
  attr_reader :guess_array
  def initialize
  @guess_array = [] #stores each round of values inputted by player 2d array
  end

  def get_guess
    # get 4 colours and add to array as a row.
    puts "Enter four values separated by spaces (e.g., 1 1 2 3):"
    input = gets.chomp
    @new_guess_array = []
    @new_guess_array = input.split
    #guess_array <= get_input
    if @new_guess_array.length != 4
      puts "Error: Please enter exactly four values."
      return nil
    end
    @new_guess_array.map!(&:to_i)
    return @new_guess_array
  end

  def convert_to_colours(new_guess_array, colours)
    new_row = []
    new_guess_array.each do |num|
      if colours.key?(num)
        new_row << colours[num]
      else
        puts "Invalid colour number"
        return nil
      end
    end
    return new_row
  end

  def update_guess_array(new_row)
    @guess_array << new_row
    return @guess_array
  end
end