class WinesController < ApplicationController

  # GET: /wines
  get "/wines" do
    erb :"/wines/index.html"
  end

  # GET: /wines/new
  get "/wines/new" do
    #binding.pry
    erb :"/wines/new.html"
  end

  post "/wines/new" do 
    #binding.pry
    @wine = Wine.new(params)
    @wine.user_id = session[:user_id]
    @wine.save
    #binding.pry
    #binding.pry
    erb :"/wines/show.html"
  end


  # GET: /wines/5
  get "/wines/:id" do
    
    erb :"/wines/show.html"
  end

  # GET: /wines/5/edit
  get "/wines/:id/edit" do
    @wine = Wine.find_by(user_id: session[:user_id])
    #binding.pry
    erb :"/wines/edit.html"
  end

  # PATCH: /wines/5
  post "/wines/:id" do
    redirect to 'users/:id/wine_list'
    #binding.pry
  end

  # DELETE: /wines/5/delete
  get "/wines/:id/delete" do
    @wine = Wine.find_by(user_id: session[:user_id])
    @wine.destroy
    redirect to "/users/show.html"
  end
end
