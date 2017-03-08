#
# inheritance.rb version 1
#
# Tesing in the Ruby repl (irb)
#   irb --simple-prompt
#   >> load 'inheritance.rb'
#
# TDD with rubydoctest:
#   sudo gem install rubydoctest
#   rubydoctest inheritance.rb
#
# Documentation (generating documentation):
#   gem install yard
#   yard doc inheritance.rb
#   yard doc *.rb
#
# reference: https://launchschool.com/books/oo_ruby/read/inheritance

# >> vehicle = Vehicle.new(4)
# >> vehicle.wheels
# => 4
class Vehicle
  attr_accessor :wheels
  def initialize(wheels)
    @wheels = wheels
  end
end

# >> bike = Bike.new
# >> bike.wheels
# => 2
class Bike < Vehicle
  def initialize(wheels = 2)
    super(wheels)
  end
end

# doctest: Create Car instance with a 4 wheels as default
# >> car = Car.new
# >> car.wheels
# => 4
class Car < Vehicle
  def initialize(wheels = 4)
    super(wheels)
  end
end
