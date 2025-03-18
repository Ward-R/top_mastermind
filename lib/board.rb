class Board
  attr_reader :colours # allows colours to be accessed in other classes (getter methods)

  def initialize
    @magenta = "M"
    @blue = "B"
    @yellow = "Y"
    @green = "G"
    @pink = "P"
    @cyan = "C"

    @white = "w"
    @red = "r"

    @colours = { 1 => @magenta, 2 => @blue, 3 => @yellow, 4 => @green, 5 => @pink, 6 => @cyan }
    @hints = { 1 => @white, 2 => @red}
    make_empty_board
  end

  def print_board_selection
    @colours.each { |number, colour| print "#{number}:#{colour} | "}
    puts ""
  end

#temp until I make the real one
  def make_empty_board
    
    blank_board_row = ['o', 'o', 'o', 'o', 'O', 'O', 'O', 'O']
    @board_array = []
    12.times do
      @board_array << blank_board_row
    end
    return @board_array
    # empty_row = "o-o-o-o||O-O-O-O||"
    # empty_board = 12.times do |i|
    #   puts empty_row
    # end
  end

  def print_updated_board
    
    #get player input and update board array to hold 2d array of hints and guesses
    #eg. board_array after two turns = [['w', 'o', 'o', 'o', 'B', 'M', 'B', 'P'],['r', 'w', 'o', 'o', 'M', 'Y', 'C', 'C']]
    #puts each row of the 2d array:
    #||w-o-o-o||B-M-B-P||
    #||r-w-o-o||M-Y-C-C||
    puts " Hints || Board ||"
    board = @board_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell_index % 4 == 0
          print "||#{@board_array[row_index][cell_index]}"
        else
          print "-#{@board_array[row_index][cell_index]}"
        end
      end
      print "||\n"
    end
    return board
  end




end