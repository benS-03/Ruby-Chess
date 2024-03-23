
=begin
  
end

class Location

    attr_reader :row, :col

    def initialize(r,c)
        @row = r
        @col = c
    end


    def +(other)
        @row += other.row
        @col += other.col
        self
    end

    def -(other)
        @row -= other.row
        @col-= other.col
        self
    end

    def *(scaler)
        @row *= scaler
        @col *= scaler
        self
    end

    def to_tup
        [row,col]
    end

end
=end