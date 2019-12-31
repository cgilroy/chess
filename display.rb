require_relative 'board'

class Display
    attr_accessor :board

    def initialize(board)
        @board = board
    end
end