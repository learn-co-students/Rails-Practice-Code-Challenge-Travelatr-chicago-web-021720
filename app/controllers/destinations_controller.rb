class DestinationsController < ApplicationController
  def show
    @destination = Destination.find_by(id: params[:id])
    @posts = @destination.posts
    @bloggers = @destination.bloggers
    @first_five = @posts.to_a.take(5)
    @most_liked= @posts.to_a.max_by{ |post| post.likes }
    @average_age = @bloggers.to_a.reduce(0) { |sum, blogger| sum + blogger.age }
    @avearge_age = @average_age/@bloggers.to_a.count
  end
end
