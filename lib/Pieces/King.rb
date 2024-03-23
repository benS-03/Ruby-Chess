

class King < Chess_piece



    def move_dirs
        [
            [0,1],
            [1,0],
            [0,-1],
            [-1,0],
            [1,1],
            [-1,1],
            [-1,-1],
            [1,-1]
        ]
    end

    def available_moves
        moves = []
        
        move_dirs.each do |dr,dc|
            
            temp_loc = [location[0] + dr, location[1] + dc]
            
            
            if enemy?(temp_loc) || empty?(temp_loc)
                moves << [temp_loc[0],temp_loc[1]]
            end  
    
        end
        moves


    end

    def to_s
        @team? "♔" : "♚"
    end
end