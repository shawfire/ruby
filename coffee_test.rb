#==========================
# filename: coffee_test.rb
#
# usage: ruby coffee_test.rb

require 'test/unit'
require_relative 'coffee'

# CoffeeTest is a feature test with the Customer and Cafe classes
class CoffeeTest < Test::Unit::TestCase

  def setup
    @cafe = create_cafe
    @customer = create_customer
    @amount_of_sugar = 1
    @coffee = '3/4 Latte'
  end

  def create_cafe
    cafe = Cafe.new(name: 'Starbucks', location: 'Courner Bourke and Swanston')
  end

  def test_create_cafe
    assert_equal('Starbucks', @cafe.name)
    assert_equal('Courner Bourke and Swanston', @cafe.location)
  end

  def create_customer
    customer = Customer.new(name: 'John')
  end

  def test_create_customer
    assert_equal('John', @customer.name)
  end

  def test_dispense_coffee
    coffee_order = @cafe.dispense_coffee(customer: @customer, coffee: @coffee, sugar: @amount_of_sugar)
    assert_equal("Hi #{@customer.name}, your #{@coffee} with #{@amount_of_sugar} is ready!", coffee_order)
  end

  def test_order_coffee
    purchase = @customer.order(cafe: @cafe, coffee: @coffee, sugar: @amount_of_sugar)
    assert_equal("Hi #{@customer.name}, your #{@coffee} with #{@amount_of_sugar} is ready!", purchase)
  end

  def test_order_wrong_coffee
    purchase = @customer.order(cafe: @cafe, coffee: "Tall Latte", sugar: @amount_of_sugar)
    assert_equal("Sorry! We only serve #{Cafe.coffees.join(", ")}.", purchase)
  end

end
