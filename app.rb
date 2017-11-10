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

post '/signUp' do
  f_name = params[:f_name].downcase
  l_name = params[:l_name].downcase
  username = params[:username].downcase
  email = params[:email].downcase
  user = User.find_or_create_by(
    f_name: f_name,
    l_name: l_name,
    username: username,
    email: email)
  session[:user_id] = user.id
  redirect "/"
end

get '/login' do
  erb :'users/login'
end

post '/login' do
  username = params[:username].downcase
  password = params[:password].downcase
  user = User.find_or_create_by(
    username: username,
    password: password)
  session[:user_id] = user.id
  redirect "/"
end
