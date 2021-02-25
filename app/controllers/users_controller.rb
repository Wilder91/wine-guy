class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :"/users/signup.html"
    #binding.pry
  end

  post "/signup" do
    user = User.create(params)
    if user.valid? 
      flash[:success] = "Successful signup"
      session[:user_id] = user.id 
      redirect to :"/users/#{user.id}"
    else
      flash[:error] = user.errors.full_messages.first
      redirect '/signup'
    end
  end

  get "/users/:id" do
    #binding.pry
    if params[:id].to_i == session[:user_id]
      erb :"/users/show.html"
    else
      #binding.pry 
      erb :"/users/invalid"
    end
  end

  get "/users/:id/edit" do
    user = current_user
    erb :"/users/edit.html"
  end

  get "/diary" do 
    binding.pry
    @wines = current_wine
    erb :"users/diary"
  end

  post "users/:id/delete" do
    #binding.pry 
    @user = User.find_by(id: session[:user_id])
    binding.pry
    @user.destroy
    erb :welcome
  end
end
