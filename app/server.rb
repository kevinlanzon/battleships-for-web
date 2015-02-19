require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/water'

class BattleShips < Sinatra::Base

  grid = Array.new(2) { Array.new(2) { '~' } }

  get '/' do
    erb :index
  end

  get '/registration' do
    erb :registration
  end

  post '/registration' do
    if params[:Name].empty?
      @message = "You didn't enter a name"
      erb :registration
    else
      @player1 = params[:Name]
      erb :registration
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
