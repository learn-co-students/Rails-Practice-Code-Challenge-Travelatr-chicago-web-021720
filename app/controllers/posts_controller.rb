class PostsController < ApplicationController

  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
    get_alls
  end

  def create
    newpost = Post.new(post_params)
    if newpost.valid?
      newpost.save
      redirect_to posts_path
    else
      @post = newpost
      get_alls
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    get_alls
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      get_alls
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
  private
  def post_params
    params.require(:post).permit(:title,:content,:blogger_id,:destination_id)
  end

  def get_alls
    @bloggers = Blogger.all
    @destinations = Destination.all
  end
end
