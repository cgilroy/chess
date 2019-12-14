require 'singleton'
require_relative 'slideable'
class Piece
    attr_accessor :pos
    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
    end

    def move_into_check?(end_pos)
        return :out_of_bounds if !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7)
        end_object = @board[end_pos]
        return :empty if end_object.is_a?(NullPiece)
        return :enemyFilled if end_object.color != @color
        return :friendlyFilled if end_object.color = @color
    end

    def valid_moves
        moves.select do |end_pos|
            result = move_into_check(end_pos)
            result == :empty || result == :enemyFilled
        end
    end
end

class Knight < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end
end

class Bishop < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def move_dirs
        diagonal_dirs
    end
end

class Rook < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end
end

class Queen < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end
end

class King < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end
end

class Pawn < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end
end

class NullPiece < Piece
    include Singleton
    def initialize

    end
end