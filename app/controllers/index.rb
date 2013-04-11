get '/' do
  @posts = Post.all();
  current_user
  erb :index
end
