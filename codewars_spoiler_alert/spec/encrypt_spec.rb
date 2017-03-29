require 'encrypt'

describe 'Encrypt' do

  describe 'encrypt' do # context is an alias for describe
    it "returns string encrypted 0 times" do
      expect(encrypt("This is a test!",0)).to eq("This is a test!")
    end

    it "returns string encrypted 1 time" do
      expect(encrypt("This is a test!",1)).to eq("hsi  etTi sats!")
    end

    it "returns string encrypted 2 times" do
      expect(encrypt("This is a test!",2)).to eq("s eT ashi tist!")
    end

  end

end
