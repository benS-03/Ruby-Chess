


class Pawn < Chess_piece



    def move_dirs
        if team
            [
                [-1,0],
                [-2,0],
                [-1,-1],
                [-1,1],
                6                   
            ]
        else
            [
                [1,0],
                [2,0],
                [1,-1],
                [1,1],
                1
            ]
        end

    end

    def available_moves
        moves = []
        
        dir = move_dirs

        if empty?([location[0] + dir[0][0], location[1] + dir[0][1]])
            moves.push([location[0] + dir[0][0], location[1] + dir[0][1]])
        end
        if location[0] == dir[4] && empty?([location[0] + dir[1][0], location[1] + dir[1][1]])
            moves.push([location[0] + dir[1][0],location[1] + dir[1][1]])
        end
        if enemy?([location[0] + dir[2][0], location[1] + dir[2][1]])
            moves.push([location[0] + dir[2][0],location[1] + dir[2][1]])
        end
        if enemy?([location[0] + dir[3][0], location[1] + dir[3][1]])
            moves.push([location[0] + dir[3][0],location[1] + dir[3][1]])
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
        @team? "♙" : "♟︎"
    end

    def to_ss
        (@team? "♙" : "♟︎") + team.to_s + location.to_s
    end

end