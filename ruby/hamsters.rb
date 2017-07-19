# hamster's name
# volume level 1 to 10
# fur color
# whether hamster is good candidate for adoption
# estimated age

puts "What is the hamster's name?"
hamster_name = gets.chomp

puts "What is the hamster's volume level (1-10)?"
volume = gets.chomp.to_i

puts "What is the hamster's fur color?"
color = gets.chomp

puts "Is the hamster a good candidate for adoption?"
adoption = gets.chomp
if adoption[0] == "y" 
  adoption = true
else
  adoption = false
end

puts "What is the hamster's estimated age?"
age = gets.chomp.to_i
if age == 0
  age = nil
end

p hamster_name
p volume
p color
p adoption
p age