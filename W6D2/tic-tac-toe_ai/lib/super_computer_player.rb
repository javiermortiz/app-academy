require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    @node = TicTacToeNode.new(game.board, mark)
    winning = @node.children.select do |child|
      child.winning_node?(mark)
    end
    return winning[0].prev_move_pos if !winning.empty?
  

    not_losing = @node.children.select do |child|
      !child.losing_node?(mark)
    end
    return not_losing[0].prev_move_pos 
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
