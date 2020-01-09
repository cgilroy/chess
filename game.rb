require_relative 'board'
require_relative 'display'

class Game
    PLAYERS = { :white => "WHITE", :black => "BLACK" }
    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @current_player = :white
    end

    def play
        pick_up_pos = nil
        place_pos = nil
        until @board.checkmate?(@current_player)
            system 'clear'
            puts "PLAYING: #{PLAYERS[@current_player]}"
            @display.render
            input = @display.cursor.get_input
            if !input.nil?
                if pick_up_pos == nil
                    pick_up_pos = input
                else
                    place_pos = input
                    begin
                        @board.move_piece(pick_up_pos,place_pos)
                    rescue
                        pick_up_pos = nil
                        place_pos = nil
                    else
                        pick_up_pos = nil
                        place_pos = nil
                        swap_turn!
                    end
                end
            end
        end
        system 'clear'
        swap_turn!
        puts "CHECKMATE #{PLAYERS[@current_player]} WINS"
        @display.render
    end

    private

    def swap_turn!
        @current_player = @current_player == :white ? :black : :white
    end

end