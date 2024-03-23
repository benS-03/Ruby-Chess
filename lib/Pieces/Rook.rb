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

            temp_loc = [location[0] + dr, location[1] + dc]
            while empty?(temp_loc) && inBounds?(temp_loc)

                moves.push([temp_loc[0],temp_loc[1]])
                
                
                temp_loc[0] += dr 
                temp_loc[1] += dc
            end
            
            if enemy?(temp_loc)
                moves.push([temp_loc[0],temp_loc[1]])
            end

            
    
        end
        moves


    end

    def validate_move?(loc)

        moves = available_moves
        if moves.include?(loc)
            return true
        end
        false

    end
    
    def move(loc)
        
        if validate_move?(loc)
            board[loc] = self
            board[location] = nil
            location = loc
        end
    end            
    

    def to_s
        @team? "♖" : "♜"
    end

    def to_ss
        (@team? "♖" : "♜") + team.to_s + location.to_s
    end

end
    


    