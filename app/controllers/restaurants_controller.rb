class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order("rating desc")
  end

end