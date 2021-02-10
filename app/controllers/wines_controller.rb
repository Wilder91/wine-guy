class WinesController < ApplicationController

  # GET: /wines
  get "/wines/" do
    #binding.pry
    @wines = current_user.wines
    erb :"/wines/"
  end

  # GET: /wines/new
  get "/wines/new" do
    erb :"/wines/new.html"
  end

  post "/wines/new" do 
    #binding.pry
    @wine = Wine.new(params)
    @wine.user_id = session[:user_id]
    @wine.save
    @user = current_user
    
    erb :"users/index.html"
  end


  post "/wines/index" do 
    #binding.pry
    erb :"wines/index.html"
  end

  # POST: /wines
  post "/wines" do
    redirect "/wines"
  end

  # GET: /wines/5
  get "/wines/:id" do
    erb :"/wines/show_wine.html"
  end

  post "/wines/:id" do
    #binding.pry
    @wine = Wine.find_by(params[:user_id])
    erb :"/wines/show_wine.html"
  end

  # GET: /wines/5/edit
  get "/wines/:id/edit" do
    #binding.pry
    @wine = Wine.find(params[:id])
    #binding.pry
    if logged_in? && @wine.user_id == current_user[:id]
      @wine = Wine.find(params[:id])
      @user = User.find(session[:user_id])
      erb :'wines/edit_wine'
    else
      redirect to('/login')
    end
    
  end

  # PATCH: /wines/5
  patch "/wines/:id" do
    redirect "/wines/:id"
  end

  # DELETE: /wines/5/delete
  delete "/wines/:id/delete" do
    redirect "/wines"
  end

  
end
