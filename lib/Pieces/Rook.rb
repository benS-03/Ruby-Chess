require_all "./lib"

class Rook < Chess_piece

    def move_dirs
        [
            [0,1],
            [1,0],
            [0,-1],
            [-1,0]
        ]
    end


    def available_moves
        moves = []
        
        move_dirs.each do |dr,dc|

            current_r, current_c = location
            temp_loc = [current_r + dr, current_c + dc]
            while empty?(temp_loc) && inBounds?(temp_loc)

                moves << [temp_loc[0],temp_loc[1]]
                
                temp_loc[0] += dr 
                temp_loc[1] += dc
            end
            
            if enemy?(temp_loc)
                moves << [temp_loc[0],temp_loc[1]]
            end
        end
        moves


    end
    

    def to_s
        @team? "♖" : "♜"
    end

    def to_ss
        (@team? "♖" : "♜") + team.to_s + location.to_s
    end

end
    


    