zoo = {
  savannah: {
    giraffes: ['Doris', 'Wilfred', 'Lola'],
    wild_dogs: ['Marvin', 'Calvin', 'Carmen'],
    lions: ['Judy', 'Quartermaster']
  },
  farm: {
    pigs: ['Bob', 'Lucy', 'Lois', 'Biggest Pig'],
    chickens: ['Betsy', 'Georgia', 'Tennessee']
  },
  food_court: {
    burgers_n_stuff: {
      hamburger: 8.99,
      hot_dog: 6.99,
      fries: 2.99,
      milkshake: 3.99
    },
    pizza: {
      pepperoni: 4.99,
      supreme: 5.99,
      cheese: 3.99,
    },
    hours: '9am - 6pm'
  }
}

puts "Meet #{zoo[:savannah][:wild_dogs][2]}, our queen wild dog!"

puts "Your total for the burger and fries comes to #{zoo[:food_court][:burgers_n_stuff][:hamburger] + zoo[:food_court][:burgers_n_stuff][:fries]}."

puts "The food court is open #{zoo[:food_court][:hours]}."

puts "Our pigs, in alphabetical order, are: #{zoo[:farm][:pigs].sort}."