class CommentsController < ApplicationController
  before_action :set_restaurant, only: [:create, :destroy]

  def create
    @comment = @restaurant.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to restaurant_path(@restaurant)
    else
      @errors = @comment.errors.full_messages
      render 'restaurants/show'
    end
  end

  def destroy
    @comment = @restaurant.comments.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end