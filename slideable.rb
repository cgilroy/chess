module Slideable
    HORIZONTAL_DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
    DIAGONAL_DIRS = [[1,1],[1,-1],[-1,-1],[-1,1]]

    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []
        move_dirs.each do |h,v|
            all_moves.concat(grow_unblocked_moves_in_dir(h,v))
        end
        all_moves
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        # debugger
        new_moves = []
        current_row, current_col = pos
        current_row += dx
        current_col += dy
        new_pos = [current_row,current_col]
        check_output = move_into_check?(new_pos)
        until check_output != :empty 
            new_moves << new_pos
            current_row += dx
            current_col += dy
            new_pos = [current_row,current_col]
            check_output = move_into_check?(new_pos)
        end
        new_moves
    end

    extend self

end