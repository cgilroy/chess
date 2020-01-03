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
        debugger
        (0..7).each do |row|
            row_str = ""
            (0..7).each do |col|
                if @cursor.cursor_pos == [row,col]
                    char = @board[[row,col]].symbol.colorize(:background => :red)
                else
                    char = @board[[row,col]].symbol
                end
                row_str += char + " "
            end
            puts row_str
        end
    end
end