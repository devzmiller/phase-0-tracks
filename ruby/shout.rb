# module Shout

#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yell_happily(words)
#     words + "!!!" + " :D"
#   end
# end

# puts Shout.yell_angrily("Fishsticks")
# puts Shout.yell_happily("Walruses")

module Shout

  def yell_angrily(words)
    words + "!!!" + " :("
  end

  def yell_happily(words)
    words + "!!!" + " :D"
  end
end

class Howler_Monkey
  include Shout
end

class Manager
  include Shout
end

monkey = Howler_Monkey.new
puts monkey.yell_happily("Bananas")
puts monkey.yell_angrily("Lions")

boss = Manager.new
puts boss.yell_angrily("Why didn't you meet your deadline?")
puts boss.yell_happily("You sold all the things")