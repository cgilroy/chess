module Stepable
    def moves
        all_moves = []
        move_diffs.each do |h,v|
            new_pos = [pos[0]+h,pos[1]+v]
            new_output = destination_square_type(new_pos)
            all_moves << new_pos if new_output == :empty || new_output == :enemyFilled
        end
        all_moves
    end
end