require_relative './list.rb'

class TodoBoard
    def initialize
        @hash = {}
        # @list = List.new(label)
    end 

    def get_command
        puts "Enter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd 
        when 'mklist'
            @hash[args[0]] = List.new(args[0])
        when 'ls'
            @hash.keys.each {|key| puts "#{key}"}
        when 'showall'
            @hash.values.each { |val| val.print}
        when 'mktodo'
            list = @hash[args[0]]
            args.delete_at(0)
            list.add_item(*args)
        when 'up'
            list = @hash[args[0]]
            args.delete_at(0)
            list.up(args[0].to_i, args[1].to_i)
        when 'down'
            list = @hash[args[0]]
            args.delete_at(0)
            list.down(args[0].to_i, args[1].to_i)
        when 'swap'
            list = @hash[args[0]]
            args.delete_at(0)
            list.swap(args[0].to_i, args[1].to_i)
        when 'sort'
            @hash[args[0]].sort_by_date!
        when 'priority'
            @hash[args[0]].print_priority
        when 'print'
            if args.length == 1
                @hash[args[0]].print
            else  
                @hash[args[0]].print_full_item(args[1].to_i)
            end 
        when 'toggle'
            list = @hash[args[0]]
            args.delete_at(0)
            list.toggle_item(args[0].to_i)
        when 'rm'
            list = @hash[arg[0]]
            args.delete_at(0)
            list.remove_item(args[0].to_i)
        when 'purge'
            @hash[args[0]].purge
        when 'quit'
            return false 
        else  
            puts "Sorry, that command is not recognized."
        end 
        true 
    end 

    def run 
        state = true
        while state 
            state = self.get_command
        end 
    end 
end

my_board = TodoBoard.new
my_board.run  