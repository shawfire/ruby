
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
    #puts "odd_chars=#{odd_chars.join}, even_chars=#{even_chars.join}, a=#{a.join}" #trace
  end
  a.join  # return the encrypted array of characters (a) as a string
end

# Pseudocode:
# => text to decode (t)
# => Split text to two halfs - first half (fh) and second half (sh)
# => built decoded array (da) by adding a character from sh (shc)
# => then a character from fh (fhc) and so on till both halfs are processed.
# => return the the da as a string
def decrypt(text, n)
  # puts "decrypt(#{text}, #{n})" # trace
  t = text
  (1..n).each do
    da = []
    half_len = t.length/2
    fh = t[0,half_len]
    sh = t[half_len,half_len+1]
    # puts "fh='#{fh}', sh='#{sh}'" #trace
    (0..(half_len+1)).each do |i|
      da << sh[i] << fh[i]
    end
    t = da.join
  end
  return t
end

# Troubleshooting test via with ruby lib/encrypt.rb
# decrypt("bdac",1) # => "abcd"
# puts "'#{decrypt('hsi  etTi sats!',1)}'" # => "This is a test!"
