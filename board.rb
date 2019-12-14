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
        populate_back_rows
        populate_front_rows
    end

    def populate_back_rows
        back_row = [Rook,Knight,Bishop,King,Queen,Bishop,Knight,Rook]
        [0,7].each do |row|
            back_row.each_with_index do |type, col|
                color = row == 0 ? :black : :white
                pos = [row,col]
                piece = type.new(color,self,pos)
                add_piece(piece,pos)
            end
        end
    end

    def populate_front_rows
        [1,6].each do |row|
            @rows[row].each_with_index do |el,col|
                color = row == 1 ? :black : :white
                add_piece(Pawn.new(color,self,[row,col]),[row,col])
            end
        end
    end

    def add_piece(piece,pos)
        self[pos] = piece
    end

    def move_piece(start_pos,end_pos)
        piece = self[start_pos]
        raise ArgumentError.new("No piece is present here") if piece.nil?
        self[start_pos] = nil
        self[end_pos] = piece
    end

end

# x = Board.new
# puts x