require_relative 'piece'
require 'byebug'
class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) { nil } }
        populate_board
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos,piece)
        row, col = pos
        @rows[row][col] = piece
    end

    def populate_board
        # debugger
        [0,1,6,7].each do |row_idx|
            row = @rows[row_idx]
            row.each_with_index do |_,col_idx|
                self[[row_idx,col_idx]] = Piece.new('blue',self,[row_idx,col_idx])
            end
        end
    end

end

x = Board.new
puts x