class PostsController < ApplicationController
  def index
    @posts = Post.where(published: true).order(posted_at: :desc).take(10)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new(posted_at: DateTime.now)
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    @post.posted_at = DateTime.now
    @post.save
    
    if @post.published
      redirect_to @post
    else
      redirect_to unpublished_path
    end
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    @post.save
    
    if @post.published
      redirect_to @post
    else
      redirect_to unpublished_path
    end
  end
  
  def archive
    @posts = Post.where(published: true).order(posted_at: :desc)
  end
  
  def unpublished
    @posts = Post.where(published: false).order(posted_at: :desc)
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :posted_at, :published, :body)
  end
end
