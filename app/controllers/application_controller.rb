require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    
  end

  get "/" do
    #binding.pry
      erb :welcome
  end

  get '/goaway' do 
    "goodbye"
  end

  helpers do
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
  end

  get '/logout' do
    #binding.pry
    session.destroy
    current_user = nil
    #binding.pry
    redirect '/'
    
  end

  

end
