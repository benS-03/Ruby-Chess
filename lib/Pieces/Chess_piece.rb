
class Chess_piece

    attr_reader :team, :location, :board

    def initialize(loc,board,team)
        @location = loc
        @team = team
        @board = board
    end


    def ally?(loc)
        if !empty?(loc)
    
            return (board[loc].team) == (team)
        else
            false
        end
    end
    

   def enemy?(loc)
    if !empty?(loc)

        return (board[loc].team) != (team)
    else
        false
    end
   end

   def empty?(loc)
    inBounds?(loc) && board[loc] == nil
   end

   def inBounds?(loc)
    (loc[1] > -1 && loc[1] < 8) && (loc[0] > -1 && loc[0] < 8)
   end

   def validate_move?(loc)

        moves = available_moves
        if moves.include?(loc) 

            a = board[loc]
            board[loc] = self

            if team
                if !board.white_in_check?
                    board[loc] = a
                    board[location] = self
                    return true
                end
            else
                if ! board.black_in_check?
                    board[loc] = a
                    board[location] = self
                    return true
                end
            end

            board[loc] = a
            board[location] = self
        end
            false
    end
    



    def move(loc)
    
        if validate_move?(loc)
            board[loc] = self
            board[location] = nil
            location = loc
            return true
        else
            false
        end            
    end
end

















