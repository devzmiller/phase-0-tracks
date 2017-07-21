# get name
# get age
# get year of birth
# get garlic bread preference yes/no
# get health insurance enroll yes/no

p "How many employees do you want to process?"

employee_count = gets.chomp.to_i
count = 0

# loop runs until it's run as many times as there are employees
while count < employee_count

  p "What is your name?"
  person_name = gets.chomp

  p "How old are you?"
  age = gets.chomp.to_i

  p "What year were you born?"
  birth_year = gets.chomp.to_i

  # compares current year to birth year 
  # and allows for a 1 year mismatch in case the user's birthday hasn't happened yet
  if (Time.new.year - birth_year) == age || (Time.new.year - birth_year - 1) == age
    correct_age = true
  else
    correct_age = false
  end

  p "The cafeteria serves garlic bread. Should we order some for you?"
  garlic_bread = gets.chomp
  if garlic_bread[0] == 'y' || garlic_bread[0] == "Y"
    garlic_bread = true
  else
    garlic_bread = false
  end

  p "Would you like to enroll in the company's health insurance?"
  insurance = gets.chomp
  if insurance[0] == 'y' || insurance[0] == "Y"
    insurance = true
  else
    insurance = false
  end

  allergy = ""

  while allergy != "done" && allergy != "sunshine"
    p "Do you have any allergies (enter them one at a time; type 'done' to finish)?"
    allergy = gets.chomp
  end

  result = ""

  # check the sunshine allergy first because the program is supposed to skip straight there
  if allergy == "sunshine"
    result = "Probably a vampire."

  # check the name second because it's supposed to overrule any clever lies 
  elsif person_name == "Drake Cula" || person_name == "Tu Fang"
      result = "Definitely a vampire."

  elsif correct_age == true && (garlic_bread == true || insurance == true)
    result = "Probably not a vampire."

  elsif correct_age == false && garlic_bread == false && insurance == false
    result = "Almost definitely a vampire."

  elsif correct_age == false && (garlic_bread == false || insurance == false)
    result = "Probably a vampire."

  else
    result = "Results inconclusive."

  end

  p result

  count += 1 # increment the loop counter
  
end

p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."