require 'singleton'

class NullPiece < Piece
    include Singleton
    attr_reader :color, :symbol 

    def initialize
        @symbol = " "
        @color = nil
    end 

    def empty?
        true 
    end 
end 