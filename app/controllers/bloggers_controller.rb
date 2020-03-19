class BloggersController < ApplicationController

    def new
        @blogger = Blogger.new
    end 

    def create
        @blogger = Blogger.new(get_params)
        if @blogger.valid?
            @blogger.save
            redirect_to blogger_path(@blogger)
        else
           @errors = @blogger.errors.full_messages
           render :new
        end
    end 

    def show
        @blogger = Blogger.find(params[:id])
    end 

    private

    def get_params
        params.require(:blogger).permit(:name, :bio, :age)
    end 

end 