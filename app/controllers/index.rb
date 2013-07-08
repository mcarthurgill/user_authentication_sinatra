enable :sessions

get '/' do
 @users = User.all
 erb :index
end

#----------- SESSIONS -----------
get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password_hash]
    session[:user] = @user.id
    redirect '/'
  else
    @error = "Please retype your email and password"
    erb :sign_in
  end
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.create(params[:user])
  if user.save
    erb :index
  else
    @error = @user.errors
    erb :sign_up
  end
end

get '/users/:id' do |id|
  @user = User.find(id)
  redirect '/'
end
