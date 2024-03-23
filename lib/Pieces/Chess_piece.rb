
class Chess_piece

    attr_reader :team, :location, :board

    def initialize(loc,board,team)
        @location = loc
        @team = team
        @board = board
    end


   def enemy?(loc)
    if !empty?(loc)

        return (board[loc].team) != (team)
    else
        false
    end
   end

   def empty?(loc)
    board[loc] == nil
   end

   def inBounds?(loc)
    (loc[1] > -1 && loc[1] < 8) && (loc[0] > -1 && loc[0] < 8)
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
            return true
        else
            false
        end            
    end
end

















