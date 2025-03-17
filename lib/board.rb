class Board
  attr_reader :colours # allows colours to be accessed in other classes (getter methods)

  def initialize
    @red = "R"
    @blue = "B"
    @yellow = "Y"
    @green = "G"
    @pink = "P"
    @white = "W"

    @colours = { 1 => @red, 2 => @blue, 3 => @yellow, 4 => @green, 5 => @pink, 6 => @white }
  end

  def print_board_selection
    @colours.each { |number, colour| print "#{number}:#{colour} | "}
    puts ""
  end

#temp until I make the real one
  def print_empty_board
    empty_row = " o-o|O-O-O-O|o-o "
    empty_board = 12.times do |i|
      puts empty_row
    end
  end







end