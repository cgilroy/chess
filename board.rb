class Board
    def initialize
        @rows = Array.new(8) { [] }
    end

    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos,piece)
        row, col = pos
        @rows[row][col] = piece
    end
end