


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

        currret_r, current_c = location

        if empty?([currret_r + dir[0][0], current_c + dir[0][1]])
            moves.push([location[0] + dir[0][0], location[1] + dir[0][1]])
        end
        if currret_r == dir[4] && empty?([current_c + dir[1][0], location[1] + dir[1][1]])
            moves.push([currret_r + dir[1][0],current_c + dir[1][1]])
        end
        if enemy?([currret_r + dir[2][0], current_c + dir[2][1]])
            moves.push([currret_r + dir[2][0],current_c + dir[2][1]])
        end
        if enemy?([currret_r + dir[3][0], current_c + dir[3][1]])
            moves.push([currret_r + dir[3][0],current_c + dir[3][1]])
        end



        moves


    end

          

    def to_s
        @team? "♙" : "♟︎"
    end

    def to_ss
        (@team? "♙" : "♟︎") + team.to_s + location.to_s
    end

end