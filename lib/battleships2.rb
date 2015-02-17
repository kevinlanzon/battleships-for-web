require 'sinatra/base'

class BattleShips < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/newgame' do
    "Please enter your name:"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
  set :views, Proc.new { File.join(root, "..", "views") }
end
