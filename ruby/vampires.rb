# get name
# get age
# get year of birth
# get garlic bread preference yes/no
# get health insurance enroll yes/no
p "How many employees do you want to process?"

employee_count = gets.chomp.to_i
count = 0

while count < employee_count

  p "What is your name?"
  person_name = gets.chomp

  p "How old are you?"
  age = gets.chomp.to_i

  p "What year were you born?"
  birth_year = gets.chomp.to_i

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

  result = ""

  if correct_age == true && (garlic_bread == true || insurance == true)
    result = "Probably not a vampire."
    if person_name == "Drake Cula" || person_name == "Tu Fang"
      result = "Definitely a vampire."
    end
  elsif correct_age == false && garlic_bread == false && insurance == false
    result = "Almost definitely a vampire."
    if person_name == "Drake Cula" || person_name == "Tu Fang"
      result = "Definitely a vampire."
    end
  elsif correct_age == false && (garlic_bread == false || insurance == false)
    result = "Probably a vampire."
    if person_name == "Drake Cula" || person_name == "Tu Fang"
      result = "Definitely a vampire."
    end
  else
    result = "Results inconclusive."
  end
  p result

  count += 1
end