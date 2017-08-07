### Word Game Class ###

## Requirements:
# - Driver code handles all input and output
# - Player one enters a word
# - Limit player two's guesses relative to the length of the word.
# - Repeated guesses don't count against player two
# - After a guess, player two should see a list of spaces with the letters they've already guessed filled in.
# - Player two gets a congratulatory/taunting message when they win/lose.
class Word_Game
  attr_accessor :word, :guess_count, :guessed_letters, :word_in_progress, :game_over, :max_guesses

  ## Initialize class.
  # Input: word
  # Instance variables: word, number of guesses, array of guessed letters, array of word being filled in, game over, max number of guesses
  def initialize(word)
    @word = word.split('')
    @guess_count = 0
    @guessed_letters = []
    @word_in_progress = Array.new(word.length, "_")
    @game_over = "running"
    @max_guesses = word.length * 2
  end

  ## Guess method.
  # Input: letter
  # Check if letter already exists in array of guessed letters. If no:
  #   Increment guess count.
  #   Loop through word, check if letter exists in word. If yes:
  #     Call update word method.
  #     Correct guess variable = true
  #   If letter does not exist in word:
  #     Correct guess variable = false
  # If word already guessed:
  #   Do not increment guess count.
  # Call game over method.
  # Return: correct guess variable, word in progress, and game over.
  def guess_letter(letter)
    if @guessed_letters.include?(letter)
      correct_guess = "duplicate"
    else
      @guess_count += 1
      if @word.include?(letter)
        correct_guess = "true"
        update_word(letter)
      else
        correct_guess = "false"
      end
    end
    game_over?
    return correct_guess, @word_in_progress, @game_over
  end

  ## Update word in progress method.
  # Input: correctly guessed letter.
  # Replace appropriate spaces in word in progress with letter.
  # Return word in progress.
  def update_word(letter)
    i = 0
    while i < @word.length
      if @word[i] == letter
        @word_in_progress[i] = letter
      end
      i+=1
    end
    @word_in_progress
  end

  ## Word complete method.
  # Check if spaces still exist in word in progress. If yes:
  #   Return word not finished.
  # If no:
  #   Return word finished.
  def word_complete?
    if @word_in_progress.index("_") == nil
      true
    else
      false
    end
  end

## Game over? method.
# Call word complete method. If word complete:
#   Return win.
# If word incomplete:
#   Check if guess count is less than maximum guess count. If yes:
#     Return game still running.
#   If guess count at maximum:
#     Return lose.
  def game_over?
    if word_complete? == true
      @game_over = "win"
    else
      if @guess_count < @max_guesses
        @game_over = "running"
      else 
        @game_over = "lose"
      end
    end
  end
end

## DRIVER CODE
# Get player one's word.
# Loop to get player one's guesses. 
print word

#   If correct guess variable is yes, print congratulatory message and word in progress.
#   If correct guess variable is no, print disappointed message and word in progress.
#   If correct guess variable is already guessed, print "you already guessed that letter" message and word in progress.
#   Loop terminates when game class returns win or lose.
# Print win/lose message.
puts "Welcome to the word guessing game!"
puts "Player One, enter a word:"
guessed_word = gets.chomp

game = Word_Game.new("guessed_word")
correct, word, game_over = game.guess_letter("c")