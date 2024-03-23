

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

    def to_s
        @team? "♔" : "♚"
    end
end