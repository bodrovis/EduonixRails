class Employee
  @@tax = 0.1

  attr_reader :name
  attr_accessor :salary

  def initialize(name, salary)
    @name = name
    @salary = salary
  end

  def calculate_salary
    salary - salary * @@tax
  end

  def self.update_tax(new_tax)
    @@tax = new_tax
  end
end

employee1 = Employee.new('John', 10)
puts "Salary for #{employee1.name} is #{employee1.calculate_salary}"
employee2 = Employee.new('Mary', 15)
puts "Salary for #{employee2.name} is #{employee2.calculate_salary}"
puts '=' * 50
Employee.update_tax(0.2)
employee1.salary = 13
puts "Salary for #{employee1.name} is #{employee1.calculate_salary}"
puts "Salary for #{employee2.name} is #{employee2.calculate_salary}"