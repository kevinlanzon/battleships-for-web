require 'sinatra/base'
require './lib/player'
require './lib/game'
require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/water'

class BattleShips < Sinatra::Base

  board = Board.new(:size => 2, :content => Cell)
  game = Game.new

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
      player1 = Player.new(params[:Name])
      @player1 = player1.name
      erb :registration
    end
  end

  get '/play' do
    @seed_data = board
    ship = Ship.new(1)
    session[:ship] = ship
    board.place(ship, :A1)
    erb :play
  end

  post '/play' do
    coordinate = params[:coordinate].to_sym
    board.shoot_at(coordinate)
    redirect '/play'
  end

  run! if app_file == $

end