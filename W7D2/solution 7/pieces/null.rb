require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton
  attr_reader :symbol, :color 

  def initialize
    @symbol = " "
    @color = nil
  end

  def nil?
    true
  end
end
