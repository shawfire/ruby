
# encrypt text by appending the characters in odd positions (odd_chars)
# => to the characters in even positions (even_chars)
# => and do this n times
#
# => e.g. "abcd" => even_chars="ac", odd_chars="bd", encrypted 1 time="bdac"
#
def encrypt(text, n)
  # where a is the array of characters to encrypt
  a = text.split('')
  (1..n).each do
    even_chars = []
    odd_chars = []
    # where c is the charater in a and
    #   i is it's index / position in a
    a.each_with_index{|c, i| i % 2 == 0 ? even_chars << c : odd_chars << c}
    a = odd_chars + even_chars  # joins the two arrays together to form a

    # trace statement
    #puts "odd_chars=#{odd_chars.join}, even_chars=#{even_chars.join}, a=#{a.join}"

  end
  a.join  # return the encrypted array of characters (a) as a string
end

def decrypt(text, n)
  puts "decrypt(#{text}, #{n})"
  # where a is the array of characters to encrypt
  a = text.split('')
  (1..n).each do
    even_chars = [] # even_chars are from index 0, 2, 4, ...
    odd_chars = []
    # where c is the charater in a and
    # => i is it's index / position in a
    a.each_with_index{|c, i| i % 2 == 0 ? even_chars << c : odd_chars << c}
    a = even_chars.reverse + odd_chars.reverse  # joins the two arrays together to form a

    # trace statement
    puts "odd_chars=#{odd_chars.join}, even_chars=#{even_chars.join}, a=#{a.join}"

  end
  a.join  # return the encrypted array of characters (a) as a string
end

# it "returns string decrypted 1 time" do
#   expect(decrypt("bdac",1)).to eq("abcd")
# end
decrypt("bdac",1)
