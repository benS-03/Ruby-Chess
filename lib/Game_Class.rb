require 'require_all'
require_all 'lib'
require_relative 'Chess_Board.rb'


class Game

    attr_reader :board, :turn

    def initialize()
       @board = Chess_board.new
       @board.reset_board
       @turn = 1
    end

    def play_game

        
        loop do

            2.times do |c|

            
                piece,piece_conv = loop do
                    @board.render_board
                    print "#{c.zero? ? "White's" : "Black's"} Turn. Enter Piece to Move: "
                    piece = gets.chomp
                    if piece.length != 2
                        puts "INVALID INPUT\nAcceptable format examples: a8 A8 b7 b7"
                        next
                    elsif !piece.match(/(([A-Z]|[a-z]){1}[1-8]{1})/)
                        puts "INVALID INPUT\nAcceptable format examples: a8 A8 b7 b7"
                        next
                    else
                        piece = piece.split("")
                        piece_conv = convert_coord(piece)
                    end

                    if board[piece_conv]== nil
                        puts "There Is No Piece There"
                        next
                    elsif board[piece_conv].team != c.zero? 
                        puts "That Is Not Your Piece"
                        next
                    elsif board[piece_conv].available_moves.empty?
                        puts "That Piece Has No Moves"
                        next
                    else
                        break piece,piece_conv

                    end

                end

                loop do

                    print "You've Selected #{piece}, Where to Move it?: "
                    target = gets.chomp
                    if target.length != 2
                        puts "INVALID INPUT\nAcceptable format examples: a8 A8 b7 b7"
                        next
                    elsif !target.match(/(([A-Z]|[a-z]){1}[1-8]{1})/)
                        puts "INVALID INPUT\nAcceptable format examples: a8 A8 b7 b7"
                        next
                    else
                        target = target.split("")
                        target_conv = convert_coord(target)
                    end

                    if !validate_and_execute_move(piece_conv,target_conv)
                        puts "INVALID MOVE"
                        next
                    else
                        puts "Move Complete"
                        break
                    end

                end
            end      
        end

    end


    def convert_coord(coord)

        ncoord = []
        coord[0] = coord[0].upcase
        ncoord[1] = 8 - coord[1].to_i

        ncoord[0] = coord[0].ord - 65
     

        ncoord.reverse
        
    end

    def validate_and_execute_move(piece, target)
        board[piece].move(target)
    end

end




