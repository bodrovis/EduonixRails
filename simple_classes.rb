class Animal
  def initialize
    puts 'A new animal is born!'
  end

  private

  def secret
    puts 'animal secret'
  end
end

class Cat < Animal
  def initialize
    puts 'A new cat is born!'
    puts self.class.name
  end

  def reveal_private
    meow
    secret
  end
  def meow
    puts 'Meow!'
  end

  private :meow
end

cat_object = Cat.new
cat_object.reveal_private
cat_object.send(:secret)
#puts cat_object.class.superclass.
    #superclass.superclass.name