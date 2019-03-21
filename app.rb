require 'sinatra/base'

class Rps < Sinatra::Base
  enable :sessions
  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:player_name] = params[:player_name]
    redirect '/play'
  end

  get '/play' do
    @player_name = session[:player_name]
    erb(:play)
  end

  run! if app_file == $PROGRAM_NAME
end