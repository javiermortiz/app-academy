require 'set'
class WordChainer
    attr_reader :dictionary
    def initialize(dictionary_file_name)
        dictionary = Set.new
        File.open(dictionary_file_name).each do |line|
            dictionary << line.chomp
        end 
        @dictionary = dictionary
    end 

    def adjacent_words(word)
        adj_words = []
        dictionary.each do |match|
            if match.length == word.length 
                word.each_char.with_index do |char, i|
                    part = word[0...i] + word[i+1..-1]
                    matching_part = match[0...i] + match[i+1..-1]
                    if matching_part == part
                        unless match == word 
                            adj_words << match 
                            break
                        end  
                        break 
                    end 
                end 
            end 
        end 
        adj_words
    end 

     def explore_current_words(current_words)
        new = []
        current_words.each do |current_word|
            self.adjacent_words(current_word).each do |adjacent_word|
                unless @all_seen_words.include?(adjacent_word)
                    new << adjacent_word 
                    @all_seen_words[adjacent_word] = current_word 
                end 
            end 
        end 
        # new.each do |new_word|
        #     puts "#{new_word} came from #{@all_seen_words[new_word]}"
        # end 
        new 
    end 

    def build_path(target)
        path = []
        previous_word = @all_seen_words[target]
        while previous_word 
            path << previous_word 
            previous_word = @all_seen_words[previous_word]
        end 
        path 
    end 

    def run(source, target)
        @current_words ||= [source]
        @all_seen_words ||= {source => nil}
        until @current_words.empty?
            new_current_words = self.explore_current_words(@current_words)
            @current_words = new_current_words 
            break if @all_seen_words.keys.include?(target)
        end 
        puts "Then path from #{source} to #{target} is the following:"
        puts self.build_path(target)
    end 

   
end 

wc = WordChainer.new('./dictionary.txt')
wc.dictionary
# p wc.adjacent_words('cat')
# p wc.adjacent_words('abaci')
# p wc.adjacent_words('abash')
# wc.run('market', 'region')
wc.run('market', 'tinker')