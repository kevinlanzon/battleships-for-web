require 'sinatra/base'

class BattleShips < Sinatra::Base

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
