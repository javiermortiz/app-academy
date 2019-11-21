class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    self.take_turn until self.game_over
    self.game_over_message 
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !self.game_over 
      self.round_success_message
      self.sequence_length += 1
    end 
  end

  def show_sequence
    self.add_random_color
    puts "#{self.seq}"
  end

  def require_sequence
    users_seq = gets.chomp.split(' ')
    if users_seq != self.seq 
      self.game_over = true
    end 
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "Success!"
  end

  def game_over_message
    puts "Game Over"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false 
    self.seq = []
  end
end

simon = Simon.new
simon.play
