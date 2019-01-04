class RestaurantsController < ApplicationController
  before_action :set_tags, only: [:index, :new]
  before_action :set_restaurant, only: [:show, :preview]

  def index
    @restaurants = Restaurant.order("rating desc")
    @restaurants = @restaurants.search(params[:search], params[:price], params[:cooking_style])
    @restaurants_geojson = @restaurants.to_geojson
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    params[:restaurant][:price] = params[:restaurant][:price].reject(&:blank?).join(" - ")
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.tag_list.add(params[:restaurant][:tag_list])
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end
 
  def show
    @overated_labels = @restaurant.labels.overated
    @honest_labels = @restaurant.labels.honest
   
    @current_user_label = @restaurant.labels.find_by_user_id(current_user)
    if @current_user_label.nil?
      @current_user_label = @restaurant.labels.build
    end
    @users_labels = @restaurant.labels.map(&:user)
  end

  def preview
    render layout: false
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :review_count, :rating, :price, :tag_list, :address, :link, :source, :image_url)
  end

  def set_tags
    @tags = ActsAsTaggableOn::Tag.all
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end