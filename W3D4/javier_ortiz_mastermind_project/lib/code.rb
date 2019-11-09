class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.has_key?(el.upcase) }
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase) 
    else  
      raise "Some of these are not valid pegs"
    end
  end 

  def pegs 
    @pegs 
  end 

  def self.random(pegs_length)
    rand_pegs = []
    pegs_length.times do 
      rand_pegs << POSSIBLE_PEGS.keys[rand(0..POSSIBLE_PEGS.length-1)]
    end
    Code.new(rand_pegs)
  end

  def self.from_string(pegs_str)
    Code.new(pegs_str.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end 
  
  def num_exact_matches(guess)
    count = 0    
    pegs.each_with_index do |peg, i|
      if peg == guess[i]
        count += 1
      end 
    end 
    count
  end

  def num_near_matches(guess)
    count = 0    
    pegs.each_with_index do |peg, i|
      if peg != guess[i]
        count += 1 if pegs.include?(guess[i])
      end 
    end 
    count
  end

  def ==(guess)
    self.pegs == guess.pegs  
  end 

end