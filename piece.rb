require 'singleton'
require_relative 'slideable'
require_relative 'stepable'
class Piece
    attr_accessor :pos
    attr_reader :color, :board
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
        return :friendlyFilled if end_object.color == @color
    end

    def valid_moves
        moves.select do |end_pos|
            result = move_into_check?(end_pos)
            result == :empty || result == :enemyFilled
        end
    end
end

class Knight < Piece
    include Stepable
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def move_diffs
        [[1,-2],[1,2],[-1,-2],[-1,2],[2,-1],[2,1],[-2,-1],[-2,1]]
    end
end

class Bishop < Piece
    include Slideable
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def move_dirs
        diagonal_dirs
    end
end

class Rook < Piece
    include Slideable
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def move_dirs
        horizontal_dirs
    end
end

class Queen < Piece
    include Slideable
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
end

class King < Piece
    include Stepable
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def move_diffs
        [[1,1],[1,-1],[-1,1],[-1,-1],[1,0],[0,1],[-1,0],[0,-1]]
    end
end

class Pawn < Piece
    def initialize(color,board,pos)
        super(color,board,pos)
    end

    def at_start_row?
        current_row = pos[0]
        return true if (current_row == 1 && color == :black) || (current_row == 6 && color == :white)
        false
    end

    def forward_dir
        color == :black ? 1 : -1
    end
    
end

class NullPiece < Piece
    include Singleton
    def initialize

    end
end