class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :"/users/new.html"
    #binding.pry
  end

  post "/signup" do
    @user = User.create(params)
    if @user.valid? 
      flash[:success] = "Successful signup"
      session[:user_id] = @user.id 
      erb :"/users/show.html"
    else
      #binding.pry
      flash[:error] = @user.errors.full_messages.first
      redirect '/signup'
    end
  end

  get "/users/:id" do
    params[:id] = session[:user_id]
    @user = current_user
    erb :"/users/show.html"
  end

  get "/users/:id/edit" do
    user = current_user
    erb :"/users/edit.html"
  end

  get "/diary" do 
    @wines = current_wine
    erb :"users/diary"
  end

  get "users/delete" do
    #binding.pry 
    @user = User.find_by(id: session[:user_id])
    @user.destroy
    redirect to '/'
  end
end
