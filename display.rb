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
        (0..7).each do |row|
            row_str = ""
            (0..7).each do |col|
                if @cursor.cursor_pos == [row,col]
                    color = @cursor.selected ? :red : :blue
                    char = @board[[row,col]].symbol.colorize(:background => color)
                else
                    char = @board[[row,col]].symbol
                end
                row_str += char + " "
            end
            puts row_str
        end
    end

    def test_loop
        loop do
            system 'clear'
            render
            @cursor.get_input
        end
    end
end