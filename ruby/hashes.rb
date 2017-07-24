# Initialize hash.
client_info = {}

# Get user input. Name, age, number of children,
# has pets?, decor theme, phone number.
# Convert user input to appropriate data types
# and store in hash.
p "What is the client's name?"
client_info[:client_name] = gets.chomp

p "How old is the client?"
client_info[:client_age] = gets.chomp.to_i

p "How many children does the client have?"
client_info[:number_of_children] = gets.chomp.to_i

p "Does the client have pets (y/n)?"
if gets.chomp == "y"
  client_info[:has_pets] = true
else
  client_info[:has_pets] = false
end

p "What is the client's desired decor theme?"
client_info[:decor_theme] = gets.chomp

p "What is the client's phone number?"
client_info[:phone_number] = gets.chomp.to_i

# Print hash.
p client_info

# Ask if user wants to update a key.
# If user enters a key they want to update,
# ask for the new value and update the hash.
p "If you want to update a field, enter the name of the field. Otherwise type 'none'."
user_choice = gets.chomp
if user_choice == "none"
  p client_info
else
  p "What do you want to update the field to?"
  client_info[user_choice.intern] = gets.chomp
  p client_info
end
