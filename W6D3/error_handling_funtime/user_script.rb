require_relative 'super_useful'

puts "'five' == #{convert_to_int('five')}"

feed_me_a_fruit
begin 
    puts "Name of the best friend:"
    name = gets.chomp
    puts "Friends for how many years?"
    yrs = gets.chomp.to_i
    puts "Favorite hobby"
    hobby = gets.chomp
    sam = BestFriend.new(name, yrs, hobby)
rescue StandardError => e  
    puts "#{e.message}"
    retry 
end 
sam.talk_about_friendship
sam.do_friendstuff
sam.give_friendship_bracelet
