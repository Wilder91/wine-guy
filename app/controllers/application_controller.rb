require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    #binding.pry
    erb :welcome
  end

  get '/logout' do 
    session.clear 
    redirect to '/' 
  end

  get '/login' do 
    #binding.pry
    erb :"users/login"

  end

  post '/login' do 
    
    @user = User.find_by(email: params[:email])
    #binding.pry
    session[:user_id] = @user.id
    #binding.pry
    erb :"users/show.html"

  end

  

  helpers do
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end

    def logged_in?
      !!current_user
    end

    def current_wine
      @current_wine ||= Wine.where(user_id: session[:user_id])
    end
  end

end
