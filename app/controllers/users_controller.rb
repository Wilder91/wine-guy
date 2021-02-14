class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    #binding.pry
    
    @wines = Wine.find_by(user_id: 2)
    @user = User.find_by(name: "Jorf Bork")
    #binding.pry
    erb :"/users/index.html"
  end

  post "/users/index.html" do
    #binding.pry
    erb :"users/index.html"
  end

  post "/users/wine_list" do
    erb :"users/wine_list"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/users" do
    redirect "/users"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get '/signup' do
    #binding.pry
    #session.clear
    
    erb :'users/sign_up'
    
  end

  post '/signup' do 
    #binding.pry
    @user = User.new(params)
    #binding.pry
    session[:user_id] = @user_id
    erb :'users/user_landing.html'
  end
  
  
  get '/login' do 
    erb :'users/login'
   end

   post '/login' do 
       #binding.pry
       @user = User.find_by(name: params[:username])
       #binding.pry
       erb :'users/user_landing.html'
   end

  
  
  

  
end
