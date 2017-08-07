# Some tests don't work anymore but were useful while writing the code.

require_relative 'word_game'

describe Word_Game do
  let(:game) {Word_Game.new("fishsticks")}

  it "initializes new game with correct word" do
    expect(game.word).to eq ["f", "i", "s", "h", "s", "t", "i", "c", "k", "s"]
  end

  it "initializes new game with correct guess count" do
    expect(game.guess_count).to eq 0
  end

  it "initializes new game with correct guess letters array" do
    expect(game.guessed_letters).to eq []
  end

  it "initializes new game with correct word in progress" do
    expect(game.word_in_progress).to eq ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
  end

  it "initializes new game with correct game over" do
    expect(game.game_over).to eq "running"
  end

  it "initializes new game with correct max guesses" do
    expect(game.max_guesses).to eq 20
  end

  it "returns correct guess variable and word in progress if letter guess is correct" do
    expect(game.guess_letter("s")).to eq ["true", ["_", "_", "s", "_", "s", "_", "_", "_", "_", "s"], "running"]
  end

  it "returns word in progress with guessed letter filled in" do
    expect(game.update_word("s")). to eq ["_", "_", "s", "_", "s", "_", "_", "_", "_", "s"]
  end

  it "returns correct_guess as false" do
    expect(game.guess_letter("a")).to eq ["false", ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], "running"]
  end

  it "returns word is complete if there are to underscores left in the word in progress array" do
    game.word_in_progress = ["f", "i", "s", "h", "s", "t", "i", "c", "k", "s"]
    expect(game.word_complete?).to eq true
  end

  it "returns win if word is complete" do
    game.word_in_progress = ["f", "i", "s", "h", "s", "t", "i", "c", "k", "s"]
    expect(game.game_over?).to eq "win"
  end

  it "returns lose if word is incomplete and max_guesses reached" do
    game.word_in_progress = ["f", "i", "_", "h", "s", "t", "i", "c", "k", "s"]
    game.guess_count = 20
    expect(game.game_over?).to eq "lose"
  end

  it "returns running if word is incomplete and max_guesses not reached" do
    game.word_in_progress = ["f", "i", "_", "h", "s", "t", "i", "c", "k", "s"]
    game.guess_count = 19
    expect(game.game_over?).to eq "running"
  end

  it "returns correct guess as duplicate if letter already guessed" do
    game.guessed_letters = ["a", "r"]
    expect(game.guess_letter("a")).to eq ["duplicate", ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"], "running"]
  end
end
