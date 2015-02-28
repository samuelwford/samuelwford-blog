class PostsController < ApplicationController
  def index
    @posts = Post.where(published: true).order(posted_at: :desc).take(10)
  end
  
  def show
    @post = Post.find(params[:id])
  end
end
