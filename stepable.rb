module Stepable
    def moves
        # debugger
        all_moves = []
        move_diffs.each do |h,v|
            new_pos = [pos[0]+h,pos[1]+v]
            all_moves << new_pos if move_into_check?(new_pos) == :empty
        end
        all_moves
    end
end