require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    attr_accessor :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0],board)
    end

    def render
        # debugger
        piece = @board[@cursor.cursor_pos]
        # puts "valid moves: #{piece.valid_moves}" if !piece.is_a?(NullPiece)
        puts "   0  1  2  3  4  5  6  7"
        (0..7).each do |row|
            row_str = "#{row} "
            (0..7).each do |col|
                color = get_tile_bg_color(row,col)
                str = " " + @board[[row,col]].symbol + " "
                char = str.colorize(:color => @board[[row,col]].color, :background => color)
                row_str += char
            end
            puts row_str + " #{row}"
        end
        puts "   0  1  2  3  4  5  6  7"
    end

    def get_tile_bg_color(row,col)
        if @cursor.cursor_pos == [row,col]
            color = @cursor.selected ? :red : :blue
        else
            color = (col.even? && row.even?) || (col.odd? && row.odd?) ? :green : :magenta
        end
        color
    end

    def test_loop
        loop do
            system 'clear'
            render
            @cursor.get_input
        end
    end
end