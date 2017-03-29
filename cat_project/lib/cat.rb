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
    cats.select{|cat| cat.color == color }
  end

  def self.colors_for_cats(cats)
    cats.map{|cat| cat.color }.uniq
  end

  def self.bowl_names_for_cats(cats)
    cats.map{|cat| cat.name.upcase }
  end

  def self.oldest_cat_in(cats)
    cats.reduce(cats[0]){|oldest_cat,cat|
      puts "oldest_cat=#{oldest_cat.name},#{oldest_cat.age} cat=#{cat.name},#{cat.age}"
      cat.age > oldest_cat.age ? cat : oldest_cat
      if cat.age > oldest_cat.age
        cat
      else
        oldest_cat
      end
    }
    cats.map.max_by{|cat| cat.age }
  end
end
