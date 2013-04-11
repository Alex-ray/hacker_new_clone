get '/user/:user_name' do 
  @user_id = session[:user_id]
  if params[:user_name] == current_user.user_name
    erb :user
  else 
    redirect to '/'
  end
end

get '/login' do 

  erb :login
end

post '/login' do 
  user = User.authenticate(params[:email], params[:password])

  sign_in(user)
  if user == nil
    erb :login
  else
    redirect to "/user/#{user.user_name}"
  end
end 

get '/logout' do
  session[:user_id] = nil

  redirect to "/"
end

get '/signup' do 

  erb :signup
end

post '/signup' do 
  user = User.create(email: params[:email], password: params[:password], user_name: params[:user_name])
  sign_in(user)
  if @errors
    erb :signup
  else
    redirect to "/user/#{user.user_name}"
  end
end

def current_user 
  return nil unless session[:user_id].present?
  @current_user ||= User.find(session[:user_id])
end

def sign_in(user)
  if user!= nil
    session[:user_id] = user.id
    current_user
  else
    @errors = "Username or password not valid"
  end
end
