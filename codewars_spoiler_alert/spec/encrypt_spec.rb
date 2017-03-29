require 'encrypt'

describe 'Encrypt' do

  describe 'encrypt' do # context is an alias for describe
    it "returns string encrypted 0 times" do
      expect(encrypt("This is a test!",0)).to eq("This is a test!")
    end
  end

end
