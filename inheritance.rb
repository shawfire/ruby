# https://launchschool.com/books/oo_ruby/read/inheritance

class Vehicle
  attr_accessor :wheels
  def initialize(wheels)
    @wheels = wheels
  end
end

class Bike < Vehicle
  def initialize(wheels = 2)
    super(wheels)
  end
end

class Car < Vehicle
  def initialize(wheels = 4)
    super(wheels)
  end
end
