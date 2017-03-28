class Cat
  attr_reader :name, :color, :age
  def initialize(name, color, age)
    @name = name
    @color = color
    @age = age
  end

  ## Allow assert_equal to work as we expect
  def ==(other)
    name == other.name &&
    color == other.color &&
    age == other.age
  end

  def self.cats_with_color(cats, color)
  end

  def self.colors_for_cats(cats)
    cats.map{|cat| cat.color }.uniq
  end

  def self.bowl_names_for_cats(cats)
    cats.map{|cat| cat.name.upcase }
  end

  def self.oldest_cat_in(cats)
  end
end
