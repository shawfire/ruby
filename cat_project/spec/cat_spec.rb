require 'cat'

describe 'Cat' do

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

end
