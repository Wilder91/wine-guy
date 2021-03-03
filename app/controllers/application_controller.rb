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
    redirect_if_logged_in
    
    erb :welcome
  end

  get '/logout' do 
    session.clear 
    redirect to '/' 
  end

  get '/login' do 
    redirect_if_logged_in
     
    erb :"users/login"

  end

  post '/login' do 
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in"
      redirect to "/users/#{user.id}"
    else 
      flash[:error] = "Invalid Email or Password"
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

    def redirect_if_logged_in 
      if logged_in?
        redirect to "/users/#{current_user.id}"
      end
    end

    def redirect_if_not_logged_in
      if !logged_in? 
        redirect to "/"
      end
    end
  end

  
    
    
end
