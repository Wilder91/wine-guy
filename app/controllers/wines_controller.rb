class WinesController < ApplicationController

  # GET: /wines
  get "/wines" do
    erb :"/wines/index.html"
  end

  # GET: /wines/new
  get "/wines/new" do
    erb :"/wines/new.html"
  end

  # POST: /wines
  post "/wines" do
    redirect "/wines"
  end

  # GET: /wines/5
  get "/wines/:id" do
    erb :"/wines/show.html"
  end

  # GET: /wines/5/edit
  get "/wines/:id/edit" do
    erb :"/wines/edit.html"
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
