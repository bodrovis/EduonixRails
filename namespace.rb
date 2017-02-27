module FancyOutputter
  class Printer
    def initialize
      puts 'Printer created!'
    end
  end
end

printer = FancyOutputter::Printer.new
