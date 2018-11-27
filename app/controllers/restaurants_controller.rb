class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order("rating desc")
    if params[:search]
      @restaurants = @restaurants.where("name LIKE ? OR address LIKE ? ", "%#{params[:search]}%", "%#{params[:search]}%")
    end
  end

end