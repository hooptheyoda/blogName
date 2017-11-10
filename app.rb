require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models'

# Database configuration
set :database, "sqlite3:development.sqlite3"

# Helper Methods
def current_user
  User.find_by_id(session[:user_id])
end

def authenticate_user
  @user = current_user
  redirect '/' if current_user.nil?
end

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
  erb :'user/accountInfo'
end

get '/pageContent' do
  erb :'pageContent'
end

get '/contact' do
  erb :'contact'
end

get '/signUp' do
  erb :'users/signUp'
end

get '/login' do
  erb :'users/login'
end
