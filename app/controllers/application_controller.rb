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
    if logged_in? 
      user = current_user
      redirect to "/users/#{user.id}"
    else
      erb :welcome
    end
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
    
    user = User.find_by(email: params[:email])
    #binding.pry
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in"
      redirect to "/users/#{user.id}"
    else 
      flash[:error] = "Username or Password is invalid"
      redirect '/login'
    end
  end

  

  helpers do
    
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) 
    end

    def logged_in?
      !!current_user
    end

    def current_tickets  
      @current_tickets ||= Ticket.where(user_id: session[:user_id])
    end
  end

  
    
    
end
