# Example lesson: 20170221 Tuesday
#
# Problem:
#   I'll be in the street ans I realise I need to withdraw $100 from an atm.
#
# What are the classes: street, atm (hidden class account)
# withdraw is an verb
#
# What attributes?
# What is/does initialize do?
# How do we create an instance of the class Atm?
# Approach when solving a problem:
#   How do I think to get to here... It's ok not to know.
#   Google is your friend. Know how to ask questions and find answers.
#   Try first. Then refactor/improve.
# Keep it simple and leave out the pin etc at the moment.
#
# Challenge:
#   Extend Atm so you can extend to disposit cash...?
#
# Personal challenge
#   Provide unit testing:
#      export PATH="/Users/shawfire/.local/bin:$PATH"
#      where /Users/shawfire/ is my home (~) directory
#      sudo gem install rubydoctest
#      rubydoctest atm.rb

class Atm

  # An atm has ... ?

  def initialize(location:, current_balance:)
    @location = location
    @current_balance = current_balance
  end

  # An atm can ... ?

  # An Atm can despense cash and a Person can withdraw cash
  #
  # >> melb_atm = Atm.new(location: "Melbourne", current_balance: 10000)
  # >> melb_atm.location
  # => "Melbourne"
  # >> melb_atm.current_balance
  # => 10000
  # >> melb_atm.dispense(50)
  # => 9950
  # >> melb_atm.current_balance
  # => 9950
  def dispense(amount)
    if @current_balance > amount
      @current_balance = @current_balance - amount
    else
      puts "Not enough money in Atm..."
    end
  end


  # An Atm can take cash and a Person can deposit cash
  #
  # >> melb_atm = Atm.new(location: "Melbourne", current_balance: 10000)
  # >> melb_atm.current_balance
  # => 10000
  # >> melb_atm.take(50)
  # => 10050
  # >> melb_atm.current_balance
  # => 10050
  def take(amount)
    #TODO assume there is enough space for the deposit
    @current_balance = @current_balance + amount
  end

  # Do we want all attributes to have a getter and a setter?
  # for example setting the balance could be dangerous.

  attr_accessor :location

  # Only allow read access unless we use dispense or intake
  attr_reader   :current_balance

end

class Account
end

class Person

  # A person has ... ?

  def initialize(name)
    @account_no = 1
    @balance = 100
    @name = name
  end

  # what can I do ... ?

  # john = Person.new("John")
  # puts "#{john} has an initial balance of #{john.balance}"
  # withdrawal_amount = 50
  # john.withdraw(withdrawal_amount,collingwood_atm)
  # puts "#{john} has a balan

  # A Person can withdraw cash
  #
  # >> melb_atm = Atm.new(location: "Melbourne", current_balance: 10000)
  # >> melb_atm.current_balance
  # => 10000
  # >> john = Person.new("John")
  # >> john.balance
  # => 100
  # >> john.withdraw(50, melb_atm)
  # => 50
  # >> john.balance
  # => 50
  def withdraw(amount, atm)
    # check if his account 1 has sufficient funds
    if @balance > amount
      atm.dispense(amount) # What if this fails
      #TODO Assuming atm has sufficient funds
      @balance -= amount
    else
      puts "Insufficient funds in your account..."
    end
  end

  # A Person can deposit cash
  #
  # >> melb_atm = Atm.new(location: "Melbourne", current_balance: 10000)
  # >> john = Person.new("John")
  # >> john.balance
  # => 100
  # >> john.deposit(80, melb_atm)
  # => 180
  # >> john.balance
  # => 180
  def deposit(amount, atm)
    #TODO Assume atm has sufficient space for funds
    atm.take(amount)
    @balance += amount
  end

  attr_reader :balance

  def to_s
    @name
  end

end

# Iterative testing

collingwood_atm = Atm.new(location: "Collingwood", current_balance: 10000)

# puts collingwood_atm.location=("Sydney")

collingwood_atm.dispense(80)

puts collingwood_atm.current_balance

john = Person.new("John")
puts "#{john} has an initial balance of #{john.balance}"
withdrawal_amount = 50
john.withdraw(withdrawal_amount,collingwood_atm)
puts "#{john} has a balance of #{john.balance} after withdrawing #{withdrawal_amount}"

deposit_amount = 80
john.deposit(deposit_amount,collingwood_atm)
puts "#{john} has a balance of #{john.balance} after depositing #{deposit_amount}"
