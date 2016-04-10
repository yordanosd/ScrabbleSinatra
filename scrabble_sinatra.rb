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
    File.truncate(FILE, 0)
    erb :score
  end

  post '/score' do

    if params["submit"] == "submit"
      @word = params["user_word"]
      @score = Scrabble::Scoring.score(@word)
      CSV.open(FILE, 'a+') do |csv|
        csv << [@word, @score]
      end

      @word_score_list = CSV.read(FILE)


      # @word_score_list = CSV.read(FILE) { |line| }

    elsif params["reset"] == "reset"
      File.truncate(FILE, 0)
    end


    ### CSV.open("./support/words.csv", "a+") do |csv|
    #   csv << @word
    # end

    # @@sale ||= begin
    #   sale_csv_info = CSV.read(file)
    #   sale_csv_info.map {|line| self.new(line)}
    # end

    # @words ||= []
    # @word_list ||= []
    # @words << params["user_word"]
    # @word_list << params["user_word"]

    # @done = params["done"]
    # @word_score = Scrabble::Scoring.score(@word)
    erb :score
  end



  run!
end
