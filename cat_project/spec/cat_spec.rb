require 'cat'

describe 'Cat' do

  # '.' precedes the tesing of a class method (aka self.bowl_names_for_cats)
  describe '.bowl_names_for_cats' do # context is an alias for describe

    before do
      @cats = [
          Cat.new('Purry', :black, 2),
          Cat.new('Scratchy', :white, 7),
          Cat.new('Feral', :fawn, 12),
          Cat.new('Tiny', :fawn, 18),
          Cat.new('Leo', :white, 4)
      ]
    end

    it "returns an array of bowl names" do
      expected_bowl_names = ['PURRY', 'SCRATCHY', 'FERAL', 'TINY', 'LEO']
      expect(Cat.bowl_names_for_cats(@cats)).to match_array(expected_bowl_names)
    end
  end

  describe 'attributes' do
    it "allows reading of :color" do
      cat = Cat.new('Max', :black, 3)
      expect(cat.color).to eq(:black)
    end
  end

  # '#' precedes an instance method
  describe '#name' do
    it "allows reading of :name" do
      cat = Cat.new('Max', :black, 3)
      expect(cat.name).to eq('Max')
    end
  end


  describe '.cats_with_color(cats, color)' do
  end

  describe '.colors_for_cats(cats)' do
  end

  describe '.oldest_cat_in(cats)' do
  end

end
