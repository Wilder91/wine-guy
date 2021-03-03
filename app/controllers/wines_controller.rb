class WinesController < ApplicationController

  # GET: /wines
  get "/wines" do
    redirect_if_not_logged_in
    erb :"/wines/index.html"
  end

  # GET: /wines/new
  get "/wines/new" do
    redirect_if_not_logged_in
    erb :"/wines/new.html"
  end

  post "/wines/new" do 
    redirect_if_not_logged_in
    wine = {name: params[:name],country: params[:country],varietal: params[:varietal]}
    wine = Wine.create(wine)
    hash = {user_id: current_user.id, wine_id: wine.id, price: params[:price], rating: params[:rating]}
    ticket = Ticket.create(hash)
    #@wine.user_id = session[user_id]
    if wine.valid? 
      redirect "/wines/#{wine.id}"
    else 
      flash[:error] = wine.errors.full_messages.to_sentence
      redirect to "/wines/new"
    end
  end

  get "/wines/:id" do
    redirect_if_not_logged_in
    @wine = Wine.find_by(id: params[:id])
    if @wine
      erb :"/wines/show.html"
    else 
      redirect to '/invalid'
    end
  end

  post "/wines/:id" do
    redirect to 'users/:id/wine_list'
  end

  
  get "/wines/:id/edit" do
    redirect_if_not_logged_in
    @wine = Wine.find_by(id: params[:id])
    @ticket = Ticket.find_by(user_id: current_user.id, wine_id: @wine.id)
    if @wine && @ticket
      erb :"/wines/edit.html"
    else 
      redirect to 'invalid'
    end
  end

  post "/wines/:id/edit" do
    wine = Wine.find_by(id: params['id'])
    ticket = Ticket.find_by(user_id: current_user.id, wine_id: wine.id)
    wine.name = params[:name]
    wine.country = params[:country]
    ticket.price = params[:price]
    ticket.rating = params[:rating]
    wine.varietal = params[:varietal]
    wine.save
    ticket.save
    redirect to "users/#{current_user.id}/diary"
  end

    # DELETE: /wines/5/delete
  post "/wines/:id/delete" do
    wine = Wine.find_by(id: params[:id])
    if wine 
      ticket = Ticket.find_by(wine_id: wine.id, user_id: current_user.id)
      ticket.destroy
    else 
      redirect to '/invalid'
    end
    redirect to "users/#{current_user.id}/diary"
  end

  get "/list" do
    redirect_if_not_logged_ins
    @wines = Wine.all.sort_by {|v| v["name"]}
     
    erb :"/wines/list"
  end

  post "/wines/:id/like" do 
    wine = Wine.find_by(id: params[:id])
    hash = {user_id: current_user.id, wine_id: wine.id}
    Ticket.create(hash)
    flash[:success] = "Wine added to your Diary"
    
    redirect to "/list"
  end

  post '/wines/:id/unlike' do 
    wine = Wine.find_by(id: params[:id])
    ticket = Ticket.find_by(user_id: current_user.id, wine_id: wine.id)
    ticket.destroy
    redirect to "/list"
  end
end
