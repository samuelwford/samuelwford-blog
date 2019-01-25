class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
  def index
    @posts = Post.where(published: true).order(posted_at: :desc).take(5)
  end
  
  def feed
    @posts = Post.where(published: true).order(posted_at: :desc)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end
  
  def show
  end
  
  def new
    @post = Post.new(posted_at: DateTime.now)
  end
  
  def edit
  end
  
  def create
    @post = Post.new(post_params)
    @post.posted_at = DateTime.now if @post.posted_at.nil?

    if @post.save
      if @post.published
        redirect_to @post
      else
        redirect_to unpublished_path
      end
    else
      render 'new'
    end
  end
  
  def update
    @post.update(post_params)
    
    if post_params[:title].downcase == 'delete' && post_params[:key] == Rails.configuration.post_key
      @post.destroy
      redirect_to posts_path
    else
      if @post.save
          if @post.published
          redirect_to @post
        else
          redirect_to unpublished_path
        end
      else
        render 'edit'
      end
    end
  end
  
  def archive
    @posts = Post.where(published: true).order(posted_at: :desc)
  end
  
  def unpublished
    @posts = Post.where(published: false).order(posted_at: :desc)
    @published_posts = Post.where(published: true).order(posted_at: :desc)
  end
  
  private
  
  def set_post
    @post = Post.find_by(slug: params[:id]) || Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title, :posted_at, :published, :key, :body, :slug)
  end
end
