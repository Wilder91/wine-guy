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
    wine = Wine.create(params)
    params["ticket"] = {user_id: user.id, wine_id: wine.id}
    ticket = Ticket.create(params["ticket"])
    #binding.pry
    wine.save
    erb :"/wines/show.html"
  end


  # GET: /wines/5
  get "/wines/:id" do
    
    erb :"/wines/show.html"
  end

  # GET: /wines/5/edit
  get "/wines/:id/edit" do
    #binding.pry
    @wine = Wine.find_by(id: params[:id])
    #binding.pry
    erb :"/wines/edit.html"
  end

  post "/wines/:id/edit" do
    #binding.pry 
    wine = Wine.find_by(id: params['id'])
    wine.name = params[:name]
    wine.country = params[:country]
    wine.price = params[:price]
    wine.rating = params[:rating]
    wine.varietal = params[:varietal]
    wine.save
    redirect to '/diary'
  end

  # PATCH: /wines/5
  post "/wines/:id" do
    redirect to 'users/:id/wine_list'
    #binding.pry
  end

  # DELETE: /wines/5/delete
  post "/wines/:id/delete" do
    @wine = Wine.find_by(id: params[:id])
    #binding.pry
    @wine.destroy
    redirect to "/diary"
  end
end
