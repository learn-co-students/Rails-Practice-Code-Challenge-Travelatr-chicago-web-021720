class PostsController < ApplicationController

    before_action :set_post, only: [:show, :edit, :update]
    before_action :set_bloggers, only: [:new, :edit]
    before_action :set_destinations, only: [:new, :edit]
    
    def show
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.likes = 0  # New posts don't have likes
        if @post.save
            redirect_to post_path(@post)
        else 
            set_bloggers
            set_destinations
            render :new
        end
    end

    def edit
    end

    def update
        @post.assign_attributes(post_params)
        @post.likes ||= 0  # Keep old likes, or assing to 0
        if @post.save
            redirect_to post_path(@post)
        else
            set_bloggers
            set_destinations
            render :edit
        end 
    end

    private

    def post_params
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
    end

    def set_post
        @post = Post.find(params[:id])
    end

    def set_bloggers
        @bloggers = Blogger.order(:name)
    end

    def set_destinations
        @destinations = Destination.order(:country, :name)
    end

end
