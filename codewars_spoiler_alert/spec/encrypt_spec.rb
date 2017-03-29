require 'encrypt'

# Codewares instructions:
#
# For building the encrypted string:
# Take every 2nd char from the string, then the other chars, that are not every 2nd char, and concat them as new String.
# Do this n times!
#
# Examples:
#
# "This is a test!", 1 -> "hsi  etTi sats!"
# "This is a test!", 2 -> "hsi  etTi sats!" -> "s eT ashi tist!"
# Write two methods:
#
# def encrypt(text, n)
# def decrypt(encrypted_text, n)
# For both methods:
# If the input-string is null or empty return exactly this value!
# If n is <= 0 then return the input text.

describe 'Encrypt' do

  describe 'encrypt' do # context is an alias for describe
    it "returns string encrypted 0 times" do
      expect(encrypt("This is a test!",0)).to eq("This is a test!")
    end

    it "returns string encrypted 1 time" do
      expect(encrypt("This is a test!",1)).to eq("hsi  etTi sats!")
    end

    it "returns string encrypted 1 time" do
      expect(encrypt("abcd",1)).to eq("bdac")
    end

    it "returns string encrypted 2 times" do
      expect(encrypt("This is a test!",2)).to eq("s eT ashi tist!")
    end
  end

  describe 'decrypt' do
    it "returns string decrypted 0 times" do
      expect(decrypt("This is a test!",0)).to eq("This is a test!")
    end

    it "returns string decrypted 1 time" do
      expect(decrypt("bdac",1)).to eq("abcd")
    end

    it "returns string decrypted 1 time" do
      expect(decrypt("hsi  etTi sats!",1)).to eq("This is a test!")
    end

    xit "returns string decrypted 2 times" do
      expect(decrypt("s eT ashi tist!",2)).to eq("This is a test!")
    end


  end

end
