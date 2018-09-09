class PostController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = current_user.posts.new
  end

  def create
  	@post = current_user.posts.new
  	@post.title = params[:post][:title]
  	@post.content = params[:post][:content]
  	@post.save
  	redirect_to :root
  end
  def show
  	@post = Post.find(params[:post_id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:post_id])
  end
  def destroy
  	@post = Post.find(params[:post_id])
  	@post.destroy
  	redirect_to :root
  end
  def edit
  	@post = Post.find(params[:post_id])
  end
  def update
  	@post = Post.find(params[:post_id])
  	@post.title = params[:post][:title]
  	@post.content = params[:post][:content]
  	@post.save
  	redirect_to :root
  end

  def commentcreate
    post = Post.find(params[:post_id])
    comment = current_user.comments.new
    comment.post_id = params[:post_id]
    comment.content = params[:comment][:content]
    comment.img_url = params[:comment][:image]
    comment.save
    redirect_to post_path(post)
  end
  def commentdestroy
    post = Post.find(params[:post_id])
    comment = Comment.find(params[:comment_id])
    comment.destroy
    redirect_to post_path(post)
  end
  def commentedit
    @comment = Comment.find(params[:comment_id])
  end
  def commentupdate
    comment = Comment.find(params[:comment_id])
    comment.content = params[:comment][:content]
    comment.img_url = params[:comment][:image]
    comment.save
    redirect_to post_path(comment.post)
  end
end

