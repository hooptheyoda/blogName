require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './models'

enable :sessions
# Database configuration
set :database, "sqlite3:development.sqlite3"

# Helper Methods
def current_user
  @current_user ||=User.find_by_id(session[:user_id])
end

def authenticate_user
  redirect '/signUp' if current_user.nil?
end

# Define routes below
get '/' do
  erb :index
end

# Define User ID
get '/users/:id' do
  authenticate_user
  @user = current_user
  @user = User.find_by_id(params[:id])
  erb :'users/accountInfo'
end

post '/pageContent' do
  @comment = Comment.create(comment: params[:textBox])
redirect :'pageContent'
end


get '/pageContent' do
    @comments = Comment.all
  erb :'pageContent'
end

get '/users/:id'  do
   @comment = Comment.find_by_id(params[:id])
   erb :'pageContent'
 end

get '/contact' do
  erb :'contact'
end

get '/signUp' do
  if current_user
    redirect "/users/#{current_user.id}"
  else
  erb :'users/signUp'
  end
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
  if current_user
    redirect "/users/#{current_user.id}"
  else
  erb :'users/login'
  end
end

post '/login' do
  username = params[:username]
  password = params[:password]
  user = User.find_by(username: username, password: password)
  redirect '/login' if user.nil || username.nil || password.nil?
  session[:user_id] = user.id
  redirect "users/#{user.id}"
end

get '/logout' do
  session.clear
  redirect '/'
end
