class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end 

  def initialize
    @secret_word = Hangman.random_word 
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end 

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    else  
      return false
    end 
  end 

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index { |el, i| indices << i if el == char}
    indices 
  end 

  def fill_indices(char, indices)
    indices.each do |idx|
      @guess_word[idx] = char
    end 
  end 

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'That has already been attempted'
      return false
    else 
      @attempted_chars << char 
      indices = self.get_matching_indices(char)
      if indices == []
        @remaining_incorrect_guesses -= 1
      else  
        self.fill_indices(char, indices)
      end 
      return true 
    end 
  end 

  def ask_user_for_guess
    puts "Enter a char:"
    self.try_guess(gets.chomp)
  end 

  def win?
    if @guess_word.join('') ==@secret_word  
      puts 'WIN'
      return true 
    else  
      return false 
    end 
  end 

  def lose?
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      return true 
    else  
      return false 
    end 
  end 

  def game_over?
    if self.win? || self.lose?
      puts @secret_word
      return true 
    else  
      return false 
    end 
  end 
end
