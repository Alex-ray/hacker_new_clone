get '/' do
  @posts = Post.all();
  current_user
  erb :index
end


get '/submit' do 

  erb :submit 
end

post '/submit' do 
  user = current_user
  user.posts << Post.create(title: params[:title], url: params[:url])
  redirect to "/"
end
