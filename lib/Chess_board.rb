

class Chess_board

    attr_reader :board

    def initialize()
        @board = [Array.new(8),
                  Array.new(8),
                  Array.new(8),
                  Array.new(8),
                  Array.new(8),
                  Array.new(8),
                  Array.new(8),
                  Array.new(8),]

    end

    def reset_board

        8.times do |c|
            self[[1,c]] = Pawn.new([1,c],self,false)
            self[[6,c]] = Pawn.new([6,c],self,true)
        end

        [[0,false],[7,true]].each do |r,color|
            self[[r,0]] = Rook.new([r,0],self,color)
            self[[r,7]] = Rook.new([r,7],self,color)
            self[[r,1]] = Knight.new([r,1],self,color)
            self[[r,6]] = Knight.new([r,6],self,color)
            self[[r,2]] = Bishop.new([r,2],self,color)
            self[[r,5]] = Bishop.new([r,5],self,color)
            self[[r,3]] = Queen.new([r,3],self,color)
            self[[r,4]] = King.new([r,4],self,color)
        end

    end

    def[]=(loc,piece)
        row, column = loc
        board[row][column] = piece;

    end

    def [](loc)
        row, column = loc
        board[row][column]
    end


    def render_board

        8.times do |r|
            print (8-r).to_s + "    |"
            8.times do |c|
                print self[[r,c]].nil? ? "  |" : self[[r,c]].to_s + " |"
            end
            print "\n"
        end
        puts "      A  B  C  D  E  F  G  H"
    end

end

