class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    #binding.pry
    
    @wines = Wine.all
    #binding.pry
    erb :"/users/index.html"
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
    @user = current_user
    #binding.pry
    erb :'users/show.html'
  end

  get '/login' do 
    erb :'users/login'
  end

  post '/login' do 
    #binding.pry
    @user = current_user
    #binding.pry
    #binding.pry
    erb :'users/show.html'
  end

  get '/logout' do
      session.clear
      
      redirect '/'
  end
  
  

  
end
