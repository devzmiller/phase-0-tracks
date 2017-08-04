class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(num)
    num.times{puts "Woof!"}
  end

  def roll_over
    puts "**roll over**"
  end

  def dog_years(human_age)
    return human_age * 5
  end

  def bring_newspaper
    puts "Here you go!"
  end

  def initialize
    puts "Initializing new puppy instance..."
  end
end

class Boba

  def initialize
    puts "You now have boba tea. Enjoy!"
  end

  def is_tasty
    puts true
  end

  def eat_boba(num)
    puts "You just ate #{num} boba!"
  end

  def drink_tea
    puts "You took a sip of the tea!"
  end
end

spot = Puppy.new
puts spot.fetch("ball") == "ball"
spot.speak(2)
spot.roll_over
puts spot.dog_years(10) == 50
spot.bring_newspaper

boba_array = []

50.times do
  boba_array << Boba.new
end

boba_array.each do |boba|
  boba.is_tasty
  boba.eat_boba(3)
  boba.drink_tea
end