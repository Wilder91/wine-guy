class UsersController < ApplicationController

  # GET: /users/new
  get "/signup" do
    erb :"/users/signup.html"
    #binding.pry
  end

  post "/signup" do
    redirect_if_logged_in
    user = User.create(params)
    if user.valid? 
      flash[:success] = "Successful signup"
      session[:user_id] = user.id 
      redirect to "/users/#{user.id}"
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
      redirect to "/invalid"
    end
  end

  get "/users/:id/edit" do
    if params[:id].to_i == session[:user_id]
      erb :"/users/edit.html"
    else 
      redirect to "/invalid"
    end
  end

  

  get "/users/:id/diary" do 
    if params[:id].to_i == session[:user_id]
      @wines = current_user.wines
      erb :"users/diary"
    else 
      redirect to "/invalid"
    end
  end

  post "/users/:id/delete" do
    if params[:id].to_i == session[:user_id]
      @user = User.find_by(id: session[:user_id])
      #binding.pry
      @user.destroy
    erb :welcome
    end
  end

  get "/invalid" do
    #binding.pry 
    erb :"users/invalid"
  end
end
