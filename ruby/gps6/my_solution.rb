# Virus Predictor

# I worked on this challenge by myself/with my GPS guide.
# I spent 1 hours on this challenge.

# EXPLANATION OF require_relative
# Gives you access to another file with a path relative to the current file.
require_relative 'state_data'


class VirusPredictor

  # Creates a new instance of the VirusPredictor class, initializes the instance variables based on the arguments.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls other methods (makes it easier to call them all in one go).
  def virus_effects
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak and will spread across the state in #{speed_of_spread} months.\n\n" 
  end

  private

  # Calculates number of deaths based on population and population density.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      factor = 0.4
    elsif @population_density >= 150
      factor = 0.3
    elsif @population_density >= 100
      factor = 0.2
    elsif @population_density >= 50
      factor = 0.1
    else
      factor = 0.05
    end

    number_of_deaths = (@population * factor).floor

    # print "#{@state} will lose #{number_of_deaths.floor} people in this outbreak"

  end

  # Calculates how fast the virus will spread based on population density.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects

STATE_DATA.each do |key, value|
  
  state = VirusPredictor.new(key, value[:population_density], value[:population])
  state.virus_effects
end

#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
#   The parent hash uses strings for keys, and uses the => syntax necessary with strings. The sub-hash uses symbols for keys, so it uses the shorthand : syntax.
# What does require_relative do? How is it different from require?
#   Require relative gives you access to another file, essentially plopping the code into your current file, and you can give it a file path relative to the current file. If you use require, you need to give it the full file path.
# What are some ways to iterate through a hash?
#   You can iterate through a ruby hash using the .each method, with the key and value as parameters. You can also use the .each_key and .each_value methods if you only need to use the keys or values.
# When refactoring virus_effects, what stood out to you about the variables, if anything?
#   It was unnecessary to pass the variables as arguments to the other methods, because they're instance variables and the other methods already have access to them. The other methods are using the instance variables, and actually not even using the arguments. Those methods don't need the arguments at all; they can just use the instance variables.
# What concept did you most solidify in this challenge?
#   This was really helpful for learning to spot refactoring opportunities. I also understand how to access and iterate through nested hashes better.