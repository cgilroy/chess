require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    attr_accessor :board

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0])
    end
end