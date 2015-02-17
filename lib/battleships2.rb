require 'sinatra/base'

class BattleShips < Sinatra::Base
  get '/' do
    @homepage
    erb :index
  end

  get '/newgame' do
    @player1 = params[:Name]
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  set :views, Proc.new { File.join(root, "..", "views") }
end
