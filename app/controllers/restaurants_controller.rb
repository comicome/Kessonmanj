class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order("rating desc")
    if params[:search]
      @restaurants = @restaurants.where("name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @current_user_label = @restaurant.labels.find_by_user_id(current_user)
    if @current_user_label.nil?
      @current_user_label = @restaurant.labels.build
    end
  end

end