require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bananas_in_pajamas" #ENV.fetch('SESSION_SECRET')
  end

  get "/" do
    erb :welcome
  end

  get '/goaway' do 
    "goodbye "
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  

end
