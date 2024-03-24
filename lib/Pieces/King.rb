

class King < Chess_piece

    def initialize(loc,board,team)
        super(loc, board, team)
        @check_flag = false
    end

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

    def vert_lat_dirs
        [
            [0,1],
            [1,0],
            [0,-1],
            [-1,0]
        ]
    end

    def diag_dirs
        [
            [1,1],
            [1,-1],
            [-1,1],
            [-1,-1],
        ]
    end

    def knight_dirs
        [
            [2,1],
            [1,2],
            [-1,2],
            [-2,1],
            [-2,-1],
            [-1,-2],
            [1,-2],
            [2,-1]
        ]
    end
    

    def available_moves
        moves = []
        
        move_dirs.each do |dr,dc|
            
            temp_loc = [location[0] + dr, location[1] + dc]
            
            
            if (enemy?(temp_loc) || empty?(temp_loc)) && !check?(temp_loc)
                moves << [temp_loc[0],temp_loc[1]]
            end  
    
        end
        moves


    end

    def move(loc)
    
        if validate_move?(loc)
            board[loc] = self
            board[location] = nil
            location = loc
            if team
                board.white_king = loc
            else
                board.black_king = loc
            end
            return true
        else
            false
        end            
    end

    def check?(loc)
        vert_lat_check?(loc) || diag_check?(loc) || knight_check?(loc) || pawn_check?(loc)
    end

    def vert_lat_check?(loc)

        vert_lat_dirs.each do |dr, dc|

            current_r, current_c = loc

            temp_loc = [current_r + dr, current_c + dc]
            
            loop do

                if !inBounds?(temp_loc)
                    break
                elsif ally?(temp_loc)
                    break
                elsif enemy?(temp_loc)
                    if board[temp_loc].is_a?(Rook) || board[temp_loc].is_a?(Queen)
                        return true
                    else
                        break
                    end
                end

                temp_loc[0] += dr
                temp_loc[1] += dc
            end
        end
        false
    end



    def diag_check?(loc)

        diag_dirs.each do |dr, dc|

            current_r, current_c = loc

            temp_loc = [current_r + dr, current_c + dc]
            
            loop do

                if !inBounds?(temp_loc)
                    break
                elsif ally?(temp_loc)
                    break
                elsif enemy?(temp_loc)
                    if board[temp_loc].is_a?(Bishop) || board[temp_loc].is_a?(Queen)
                        return true
                    else
                        break
                    end
                end

                temp_loc[0] += dr
                temp_loc[1] += dc
            end
        end
        false
    end

    def knight_check?(loc)

        knight_dirs.each do |dr, dc|
                current_r, current_c = loc
                temp_loc = [current_r + dr, current_c + dc]
                if !inBounds?(temp_loc)
                    next
                end
                if enemy?(temp_loc) && board[temp_loc].is_a?(Knight)
                    return true
                end
            end

        false
    end


    def pawn_check?(loc) 
        i = 0
        diag_dirs.each do |dr, dc|

            current_r, current_c = loc

            temp_loc = [current_r + dr, current_c + dc]

            if i < 2 && !team && inBounds?(temp_loc)
                if enemy?(temp_loc) && board[temp_loc].is_a?(Pawn)
                    return true
                end

            elsif i >= 2 && team && inBounds?(temp_loc)
                if enemy?(temp_loc) && board[temp_loc].is_a?(Pawn)
                    return true
                end
            end

            i += 1
            
        end
        false
    end







    def to_s
        @team? "♔" : "♚"
    end
end
