class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order("rating desc")
    if params[:search]
      @restaurants = @restaurants.where("name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
    if params[:cooking_style]
      @restaurants = @restaurants.tagged_with(params[:cooking_style], :any => true)
    end
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @current_user_label = @restaurant.labels.find_by_user_id(current_user)
    if @current_user_label.nil?
      @current_user_label = @restaurant.labels.build
    end
    # @users_labels = @restaurant.labels.map do |label|
    #   label.user
    # end
    # @users_labels = @restaurant.labels.map{|label| label.user }
    @users_labels = @restaurant.labels.map(&:user)
  end
end