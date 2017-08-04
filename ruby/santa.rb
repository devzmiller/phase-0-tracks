class Santa
  attr_reader :ethnicity
  attr_accessor :gender,:reindeer_ranking, :age

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
  end

  def get_mad_at(reindeer_name)
    @reindeer_ranking.insert(-1, @reindeer_ranking.delete_at(@reindeer_ranking.index(reindeer_name)))
  end

  # def gender=(gender)
  #   @gender = gender
  # end

  # def age
  #   @age
  # end

  # def ethnicity
  #   @ethnicity
  # end

end

claus = Santa.new("genderqueer", "white")
claus.speak
claus.eat_milk_and_cookies("gingerbread")
santas = []
genders = ["female", "male", "genderqueer", "agender", "gender fluid", "N/A", "bigender", "none of the above"]
ethnicities = ["black", "Japanese", "white", "Turkish", "Latino", "Japanese-African", "prefer not to say", "N/A"]
genders.length.times do |i|
  santas << Santa.new(genders[i], ethnicities[i])
end
puts claus.celebrate_birthday
puts claus.get_mad_at("Dancer")
puts claus.gender = "bigender"
puts claus.age
puts claus.ethnicity

100.times do
  santa = Santa.new(genders.sample, ethnicities.sample)
  santa.age = rand(141)
  puts "Gender: #{santa.gender}"
  puts "Age: #{santa.age}"
  puts "Reindeer ranking: #{santa.reindeer_ranking}"
  puts "Ethnicity: #{santa.ethnicity}"
end