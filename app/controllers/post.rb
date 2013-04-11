
get '/user/:user_name/posts' do 
  user = current_user
  if params[:user_name] == user.user_name
    @posts = user.posts
    erb :user_posts
  else
    redirect to "/"
  end
end

get '/:post_id/comment' do 
  @post = Post.find(params[:post_id])
  erb :comment
end


post '/:post_id/comment' do
  user = current_user
  post = Post.find(params[:post_id])
  comment = Comment.create(body: params[:body])
  user.comments << comment
  post.comments << comment
  redirect to "/post/#{post.id}"
end

get '/post/:post_id' do 
  @post = Post.find(params[:post_id])
  @comments = @post.comments

  erb :post
end


get '/post/:post_id/upvote' do
  user = current_user
  post = Post.find(params[:post_id])
  vote = PostVote.create()
  user.post_votes << vote
  post.post_votes << vote
  redirect to "/"
end


get '/comment/:comment_id/upvote' do
  user = current_user
  comment = Comment.find(params[:comment_id])
  vote = CommentVote.create()
  user.comment_votes << vote
  comment.comment_votes << vote
  redirect to "/post/#{comment.post.id}"
end
