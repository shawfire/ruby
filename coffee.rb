#====================
# filename: coffee.rb

# John wants to buy a coffee from his local cafe.
# He likes to dring 3/4 latter's with 1 sugar.

# PROBLEM: Trent needs a coffee

# SOLUTION: If the cafe serves 3/4 lattes it will dispense it to me when asked.

# second_tier challenge.

# it tells me how much it is, requires me to
# input that into the terminal before it will serve me.

# classes
#   John attributes: name, preference, allergies
#   Cafe: location, menu
#   Menu:

# Personal Challenge:
#   Use TDD/BDD to unit/feature test Cafe and Customer
#     to allow the Customer to order a Coffee (i.e. caffee_test.rb)
#   Test the edge case where the Coffee ardered is not make by this Cafe.

class Cafe
  # Cafe has ... ?

  @@coffees = ["3/4 Latte", "Regular Latte"]
  @@cafes = []
  @@location = [isle 1..20][shelf 1..5][position 1..5]
  [ false, ]
  isles.each 1..20 do |isle|
      shelfs.each 1..20 do |shelf|
          positions.each 1..20 do |position|
             @@location[isle][shelf][position] = false

             locations.csv
             items.csv

  def initialize(name:, location:)
    @name = name
    @location = location
    @@cafes.push(self)
    @@location[1][3][5] = true
  end

  # Cafe can ... ?

  def dispense_coffee(customer:, coffee:, sugar:)
    if @@coffees.include?(coffee)
      return "Hi #{customer.name}, your #{coffee} with #{sugar} is ready!"
    else
      return "Sorry! We only serve #{@@coffees.join(", ")}."
    end
  end

  attr_reader :name, :location

  def self.coffees
    @@coffees
  end

  def self.cafes
    @@cafes
  end


end

class Customer
  # Customer has ... ?
  def initialize(name: 'John')
    @name = name
  end

  def order(cafe:, coffee:, sugar:)
    return cafe.dispense_coffee(customer: self, coffee: coffee, sugar: sugar)
  end

  # Customer can ... ?
  attr_reader :name

end
