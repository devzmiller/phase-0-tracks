# fake name method, takes real name as argument
def fake_name(real_name)

  # split into array of first name and last name
  # swap first and last name
  # convert back to string
  fake_name_arr = real_name.split(' ')
  temp_name = fake_name_arr[0]
  fake_name_arr[0] = fake_name_arr[1]
  fake_name_arr[1] = temp_name
  fake_name = fake_name_arr.join(' ')

  # convert string to array of characters
  fake_name_arr = fake_name.downcase.split('')

  # loop through array, check if letter is vowel
  # if letter is vowel, change to next vowel
  # if letter is consonant, change to next consonant

  counter = 0 
  vowel_arr = 'aeiou'.split('')
  consonant_arr = 'bcdfghjklmnpqrstvwxyz'.split('')

  # loop through name array
  fake_name_arr.each do |letter|
    if vowel_arr.include?(letter)
      letter_index = vowel_arr.index(letter)
      if letter == 'u'
        fake_name_arr[counter] = 'a'
      else
        fake_name_arr[counter] = vowel_arr[letter_index + 1]
      end

    elsif letter == ' '
      fake_name_arr[counter] = ' '

    else
      letter_index = consonant_arr.index(letter)
      if letter == 'z'
        fake_name_arr[counter] = 'b'
      else
        fake_name_arr[counter] = consonant_arr[letter_index +1]
      end

    end

    counter += 1

  end

  fake_name = fake_name_arr.join('')

  # split name at spaces and capitalize first letters
  fake_name_arr = fake_name.split(' ')

  counter = 0

  fake_name_arr.each do |i|
    fake_name_arr[counter] = fake_name_arr[counter].capitalize
    counter += 1
  end

  fake_name = fake_name_arr.join(' ')

  # return fake name
  return fake_name

end

user_input = ''

all_names = {}

while user_input != 'quit'
  puts "Enter a name you'd like to turn into a code name (type 'quit' to quit): "
  user_input = gets.chomp
  if user_input != 'quit'
    code_name = fake_name(user_input)
    puts code_name
    name = {user_input => code_name}
    all_names.update(name)
  end
end

all_names.each { |real_name, code_name| puts "#{real_name} is also known as #{code_name}." }
