require_relative './spec_helper'

describe Scrabble::Player do
  it "should be an object we have access to" do
    Scrabble::Player.wont_be_nil
  end
end

describe "Scrabble::Player#name" do
  # returns the value of the @name instance variable
  it "should return the value 'Joe' when player instance is named Joe" do
    joe = Scrabble::Player.new(name: "Joe")
    joe.name.must_equal ("Joe")
  end
end

describe "Scrabble::Player#plays" do
  joe = Scrabble::Player.new(name: "Joe")

  it "should return the score '5' for the word 'cat'" do
    joe.play("cat").must_equal 5
  end

end

describe "Scrabble::Player#play(word)" do
  mary = Scrabble::Player.new(name: "Mary")

  it "should return false if player has already won" do
    # starts mary off with a bunch of words already played, then adds "cat"
    array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]

    # create an each method that will play the words in the array one by one
    array_of_words.each do |word_played|
      mary.play(word_played)
    end

    mary.play("cat").must_equal false
  end
end

describe "Scrabble::Player#total_score" do
  jane = Scrabble::Player.new(name: "Jane")
  it %!should return '243' for array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]! do
    array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]

    # create an each method that will play the words in the array one by one
    array_of_words.each do |word_played|
      jane.play(word_played)
    end

    jane.total_score.must_equal 243
  end
end

describe "Scrabble::Player#highest_scoring_word" do
  april = Scrabble::Player.new(name: "April")

  # it should return the highest scoring played WORD
  it %!should return "frog" for the words played "frog" and "nose"! do
    april.play("frog")
    april.play("nose")
    april.highest_scoring_word.must_equal "frog"
  end

  it %!should return 'aaaaaad' for array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]! do
    fox = Scrabble::Player.new(name: "Fox")
    array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]
    # create an each method that will play the words in the array one by one
    array_of_words.each do |word_played|
      fox.play(word_played)
    end

    fox.highest_scoring_word.must_equal "aaaaaad"
  end


end

describe "Scrabble::Player#highest_word_score" do
  jody = Scrabble::Player.new(name: "Jody")

  # it should return the highest scoring played WORD
  it %!should return "8" for the words played "frog" and "nose"! do
    jody.play("frog")
    jody.play("nose")
    jody.highest_word_score.must_equal 8
  end

  it %!should return '58' for array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]! do
    fox = Scrabble::Player.new(name: "Fox")
    array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]
    # create an each method that will play the words in the array one by one
    array_of_words.each do |word_played|
      fox.play(word_played)
    end

    fox.highest_word_score.must_equal 58
  end

end

describe "Scrabble::Player#won?" do

  it %!should return 'true' for array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]! do
    fox = Scrabble::Player.new(name: "Fox")
    array_of_words = ["nose", "aaaaaad", "eeeeeed", "frog", "rrrrrrr", "qqqqqj"]
    # create an each method that will play the words in the array one by one
    array_of_words.each do |word_played|
      fox.play(word_played)
    end

    fox.won?.must_equal true
  end

  it %!should return "false" for the words played "frog" and "nose"! do
    jody = Scrabble::Player.new(name: "Jody")
    jody.play("frog")
    jody.play("nose")
    jody.won?.must_equal false
  end
end

describe "Scrabble::Player#tiles" do
  bill = Scrabble::Player.new(name: "Bill")
  # should return a collection of letters that the player can play (max 7) -- that's their own personal little tray of letters
  it "should return 7 letters" do
    bill.tiles.length.must_equal 7
  end
end
