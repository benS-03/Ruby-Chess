
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
end

















