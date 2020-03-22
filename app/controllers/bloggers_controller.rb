class BloggersController < ApplicationController
  def new
    @blogger=Blogger.new
  end

  def index
    @bloggers=Blogger.all
  end

  def create
    newblogger = Blogger.new(blogger_params)
    if newblogger.valid?
      newblogger.save
      redirect_to bloggers_path
    else
      @blogger = newblogger
      render :new
    end
  end

  def show
    @blogger = Blogger.find_by(id: params[:id])
  end

  private
  def blogger_params
    params.require(:blogger).permit(:name,:age,:bio)
  end

end
