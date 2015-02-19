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
      player1 = Player.new(name: params[:Name])
      @player1 = player1.name
      erb :registration
    end
  end

  get '/play' do
    @seed_data = grid
    erb :play
  end

  post '/play' do
    coordinate = params[:coordinate]
    grid.shoot_at(coordinate)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
