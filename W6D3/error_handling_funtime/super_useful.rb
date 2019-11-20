# PHASE 2
require "byebug"
def convert_to_int(str)
  Integer(str)
  rescue ArgumentError => e
    return nil 
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else 
    raise StandardError.new("You didn't feed the monster with fruit")
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  rescue StandardError => e  
    if maybe_fruit.include?("coffee")
      retry 
    end 
    puts "#{e.message}" 
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if name.length <= 0 || fav_pastime.length <= 0
      raise StandardError.new("You provided an empty string for name or fav_pastime")
    end 
    @name = name
    if yrs_known < 5
      raise StandardError.new("You need to know someone for more than 5 years for them to be your best friend.")
    end 
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


