require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    if logged_in?
      redirect to '/users/show.html'
    else
      erb :welcome
    end
  end

  get '/goaway' do 
    "goodbye"
  end

  def current_user
    #binding.pry
    @current_user ||= User.find_by(params[:id])
  end

  def logged_in?
    !!session[:user_id]
  end

  

end
