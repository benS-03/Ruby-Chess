
require "require_all"

require_all "./lib"


g = Chess_board.new

g[[1,2]] = Rook.new([1,2],g,true)
g[[3,3]] = Knight.new([1,2],g,false)

g[[5,2]] = King.new([5,2],g,true)

g.render_board

p g[[5,2]].vert_lat_check([5,2])
p g[[5,2]].diag_check([5,2])
p g[[5,2]].knight_check([5,2])
p g[[5,2]].pawn_check([5,2])