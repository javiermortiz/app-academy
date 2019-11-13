require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name 
        @funding = funding
        @salaries = salaries
        @employees = []
    end 

    def valid_title?(title)
        @salaries.has_key?(title)
    end 

    def >(other_startup)
        self.funding > other_startup.funding
    end 

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else  
            raise "Error"
        end 
    end 

    def size
        @employees.length
    end 

    def pay_employee(employee)
        payment = salaries[employee.title]
        if @funding > payment
            employee.pay(payment)
            @funding -= payment 
        else 
            raise "Error"
        end 
    end 

    def payday
        @employees.each { |employee| self.pay_employee(employee)}
    end 

    def average_salary
        sum = 0
        count = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
            count += 1
        end 
        sum / (count * 1.0)
    end 

    def close
        @employees = []
        @funding = 0
    end 

    def acquire(startup_2)
        @funding += startup_2.funding
        @salaries = startup_2.salaries.merge(@salaries)
        @employees += startup_2.employees
        startup_2.close
    end 
end
