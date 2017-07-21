# loop: for every character in string, check if character
# is a space (if yes do nothing), if character is a letter,
# change letter into letter.next

def encrypt(string)

  index = 0

  while index < string.length
    if string[index] != " "
      if string[index] == "z"
        string[index] = "a"
      else
        string[index] = string[index].next
      end
    end
    index += 1
  end

  return string
end

# loop: for every character in string, check if character
# is a space (if so do nothing), or an a (if yes, change
# to a z), if character is another letter, change it to
# the previous letter using character encoding

def decrypt(string)

  index = 0
  while index < string.length

    if string[index] != " "
      if string[index] == "a"
        string[index] = "z"
      else
        string[index] = (string[index].ord - 1).chr
      end
    end
    index += 1
  end
  return string
end


def main()
  s1 = "dog"
  encrypt(s1)
  if s1 != "eph"
    p "s1 didn't encrypt"
  end

  s2 = "app le"
  encrypt(s2)
  if s2 != "bqq mf"
    p "s2 didn't encrypt"
  end

  s3 = "zpp le"
  encrypt(s3)
  if s3 != "aqq mf"
    p "s3 didn't encrypt"
  end

  s4 = "eph"
  decrypt(s4)
  if s4 != "dog"
    p "s4 didn't decrypt"
  end

  s5 = "dog"
  encrypt(s5)
  decrypt(s5)
  if s5 != "dog"
    p "s5 didn't encrypt/decrypt"
  end

  s6 = "bqq mf"
  decrypt(s6)
  if s6 != "app le"
    p "s6 didn't decrypt"
  end

  s6 = "aqq mf"
  decrypt(s6)
  if s6 != "zpp le"
    p "s6 didn't decrypt"
  end

  # s = "swordfish"
  # puts decrypt(encrypt(s))

  puts "Do you want to decrypt or encrypt (d/e)?"
  choice = gets.chomp

  puts "What's the password?"
  pass = gets.chomp

  if choice == "d"
    puts decrypt(pass)
  elsif choice == "e"
    puts encrypt(pass)
  else
    puts "Invalid selection"
  end
end

# Encrypt returns the encrypted string, which then gets passed as argument to decrypt,
# which returns the decrypted string.
