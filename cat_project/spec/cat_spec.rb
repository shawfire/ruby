require 'cat'

describe 'Cat' do

  before do
    @cats = [
        Cat.new('Purry', :black, 2),
        Cat.new('Scratchy', :white, 7),
        Cat.new('Feral', :fawn, 12),
        Cat.new('Tiny', :fawn, 18),
        Cat.new('Leo', :white, 4)
    ]
  end

  # '.' precedes the tesing of a class method (aka self.bowl_names_for_cats)
  describe '.bowl_names_for_cats' do # context is an alias for describe

    it "returns an array of bowl names" do
      expected_bowl_names = ['PURRY', 'SCRATCHY', 'FERAL', 'TINY', 'LEO']
      expect(Cat.bowl_names_for_cats(@cats)).to match_array(expected_bowl_names)
    end
  end

  describe 'attributes' do
    before do
      @cat = Cat.new('Max', :black, 3)
    end

    it "allows reading of :color" do
      expect(@cat.color).to eq(:black)
    end

    it "allows reading of age" do
      expect(@cat.age).to eq(3)
    end

    it "allows reading of name" do
      expect(@cat.name).to eq('Max')
    end
  end

  # '#' precedes an instance method
  describe '#==' do
    it "allows comparison of cats" do
      cat = Cat.new('Max', :black, 3)
      expect(cat).to eq(cat)
    end
  end

  # def test_select_colors
  #     colors = Cat.cats_with_color(@cats, :black)
  #     assert_equal(colors, [
  #         Cat.new('Purry', :black, 2)
  #     ])
  #
  #     colors = Cat.cats_with_color(@cats, :fawn)
  #     assert_equal(colors, [
  #         Cat.new('Feral', :fawn, 12),
  #         Cat.new('Tiny', :fawn, 18)
  #     ])
  #
  #     colors = Cat.cats_with_color(@cats, :pink)
  #     assert_equal(colors, [])
  # end
  describe ".cats_with_color(cats, color)" do
    it "returns cats that are white" do
      expect(Cat.cats_with_color(@cats, :white)).to eq([
          Cat.new('Scratchy', :white, 7),
          Cat.new('Leo', :white, 4)
      ])
    end
  end

  describe ".colors_for_cats(cats)" do
    it "returns all the unique cat colors" do
      expect(Cat.colors_for_cats(@cats)).to eq([:black, :white, :fawn])
    end
  end

  describe ".oldest_cat_in(cats)" do
    it "returns the oldest cat" do
      expect(Cat.oldest_cat_in(@cats)).to eq(Cat.new('Tiny', :fawn, 18))
    end
  end

end
