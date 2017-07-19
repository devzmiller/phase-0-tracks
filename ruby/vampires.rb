# get name
# get age
# get year of birth
# get garlic bread preference yes/no
# get health insurance enroll yes/no

p "What is your name?"
person_name = gets.chomp

p "How old are you?"
age = gets.chomp.to_i

p "What year were you born?"
birth_year = gets.chomp.to_i

p "The cafeteria serves garlic bread. Should we order some for you?"
garlic_bread = gets.chomp
if garlic_bread[0] == 'y' || garlic_bread[0] == "Y"
  garlic_bread = true
else
  garlic_bread = false
end

p "Would you like to enroll in the company's health insurance?"
insurance = get.chomp
if insurance[0] == 'y' || insurance[0] == "Y"
  insurance = true
else
  insurance = false
end