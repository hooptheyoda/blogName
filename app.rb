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
  @comments = Comment.all
  erb :index
end

get '/signUp' do
  if current_user
    redirect "/users/#{current_user.id}"
  else
  erb :'users/signUp'
  end
end

post '/signUp' do
  f_name = params[:f_name]
  l_name = params[:l_name]
  username = params[:username]
  password = params[:password]
  email = params[:email]
  user = User.create(
    f_name: f_name,
    l_name: l_name,
    username: username,
    password: password,
    email: email)
    # break if user.nil?
    # break if user.nil?
    # break if f_name.nil?
    # break if l_name.nil?
    # break if username.nil?
    # break if password.nil?
    # break if email.nil?
     # if user.nil? break
     # if f_name.nil?   break
     # if l_name.nil?  break
     # if username.nil? break
     # if password.nil?  break
     # if email.nil?  break
 session[:user_id] = user.id
  redirect "/users/#{current_user.id}"
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
  redirect '/login' if user.nil?
  redirect '/login' if username.nil?
  redirect '/login' if password.nil?
  session[:user_id] = user.id
  redirect "users/#{user.id}"
end

get '/logout' do
  session.clear
  redirect '/'
end

delete '/users/:id' do
  user = User.find_by_id(params[:id])
  user.destroy
  redirect '/'
end

patch '/users/:id' do
  user = User.find_by_id(params[:id])
  user.update(
    f_name: params[:f_name],
    l_name: params[:l_name],
    username: params[:username],
    password: params[:password],
    email: params[:email]
  )
  session[:user_id] = user.id
  redirect "/users/#{current_user.id}"
end

# user edit route
get '/users/:id/edit' do
  @user = User.find_by_id(params[:id])
  erb :'users/edit'
end
