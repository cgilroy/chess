require 'singleton'

class Piece
    def initialize(color,board,pos)
        @color = color
        @board = board
        @pos = pos
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