require "byebug"
class Employee
    attr_reader :name, :title, :salary, :boss
    def initialize(name, title, salary, boss)
        @name = name 
        @title = title 
        @salary = salary
        @boss = boss 
    end 

    def bonus(multiplier)
        bonus = (salary) * multiplier
    end 

    def get_all_subs_salaries
        return if title == 'TA'
        subs = subemployees
        total = 0
        until subs.empty?
            current_sub = subs.shift 
            total += current_sub.salary 
            current_sub.subemployees.each { |sub| subs << sub } unless current_sub.title == "TA"
        end 
        total 
    end 
end 

class Manager < Employee
    attr_reader :subemployees
    def initialize(name, title, salary, boss, subemployees)
        super(name, title, salary, boss)
        @subemployees = subemployees
    end

    def bonus(multiplier)
        all_subs_salaries = self.get_all_subs_salaries
        bonus = all_subs_salaries * multiplier 
    end 
end 

david = Employee.new("David", "TA", 10000, "Darren")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [david, shawna])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)