require 'sinatra'
require 'CSV'
require_relative 'lib/scrabble.rb'

class ScrabbleSinatra < Sinatra::Base
  FILE = "./support/words.csv"

  get '/' do
    File.truncate(FILE, 0)
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do

    @word = params["user_word"]
    @score = Scrabble::Scoring.score(@word)

    erb :score
  end

  get '/score-many' do
    File.truncate(FILE, 0)
    erb :score_many
  end

  post '/score-many' do

    if params["submit"] == ""
      @word = params["user_word"]

      @score = Scrabble::Scoring.score(@word)
      CSV.open(FILE, 'a+') do |csv|
        csv << [@word, @score]
      end

      @word_score_list = CSV.read(FILE).reverse!

    elsif params["reset"] == ""
      File.truncate(FILE, 0)
    end

    erb :score_many
  end

  run!
end
