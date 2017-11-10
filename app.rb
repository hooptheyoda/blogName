require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models'

# Database configuration
set :database, "sqlite3:development.sqlite3"

# Define routes below
get '/' do
  erb :index
end

# Define User
get '/users' do
  @users = User.all
  erb :'users/index'
end

# Define User ID 
get '/users/:id' do
  @user = User.find_by_id(params[:id])
  erb :'users/show'
end
