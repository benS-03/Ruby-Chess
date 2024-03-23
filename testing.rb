


require 'require_all'
require_all 'lib'

def main

    b = Chess_board.new

    b.reset_board

    b.render_board

    b[[5,6]] = Knight.new([3,4],b,false)
    b[[5,4]] = Knight.new([3,4],b,false)

    b.render_board

    puts b[[6,5]].available_moves.to_s

end

main