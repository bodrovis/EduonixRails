module Utils
  def normalize_name!
    self.name.gsub! /\W/, ''
  end
end

class Animal
  include Utils
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Human
  include Utils
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

human = Human.new('some???name!! goes here')
puts human.normalize_name!