require_relative 'piece'
require 'byebug'
class Board
    def initialize
        @null = NullPiece.instance
        @rows = Array.new(8) { Array.new(8) { @null } }
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
        # debugger
        piece = self[start_pos]
        raise ArgumentError.new("No piece is present here") if piece == @null
        raise ArgumentError.new("Invalid end position") if !piece.moves.include?(end_pos)
        raise ArgumentError.new("This would move you into check!") if piece.move_into_check?(end_pos)
        self[start_pos] = @null
        self[end_pos] = piece
        piece.pos = end_pos
    end

    def move_piece!(start_pos,end_pos)
        piece = self[start_pos]
        self[start_pos] = @null
        self[end_pos] = piece
        piece.pos = end_pos
    end

    def valid_pos?(pos)
        # debugger
        x,y = pos
        return true unless x < 0 || x > 7 || y < 0 || y > 7
        false
    end

    def in_check?(color)
        king_pos = find_king(color).pos
        pieces.each do |piece|
            return true if piece.moves.include?(king_pos)
        end
        false
    end

    def checkmate?(color)
        # debugger
        any_moves = pieces.any? { |piece| color == piece.color && piece.valid_moves.length != 0 }
        return true if in_check?(color) && !any_moves
        false
    end

    def find_king(color)
        pieces.each do |piece|
            return piece if piece.is_a?(King) && color == piece.color
        end
    end

    def pieces
        output = []
        (0..7).each do |row|
            (0..7).each do |col|
                piece = self[[row,col]]
                output << piece unless piece.is_a?(NullPiece)
            end
        end
        output
    end
end

# x = Board.new
# puts x