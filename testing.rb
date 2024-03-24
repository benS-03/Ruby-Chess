require 'require_all'
require_all 'lib'

def main

    g = Game.new
    g.play_game

end

def othermain
a = [[1,2],[2,3],[5,6]]

a.each_with_index do |a,b,i|

    puts a.to_s, b.to_s ,i.to_s
end


end

main

