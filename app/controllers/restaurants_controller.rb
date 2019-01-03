class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.order("rating desc")
    @restaurants_geo = []
    if params[:search]
      @restaurants = @restaurants.where("name LIKE ? OR address LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    end
    if params[:price]
      params[:price] = params[:price].reject(&:blank?).join(" - ")
      @restaurants = @restaurants.where("price LIKE ?", "%#{params[:price]}%")
    end
    if params[:cooking_style]
      @restaurants = @restaurants.tagged_with(params[:cooking_style], :any => true)
    end  
    @tags = ActsAsTaggableOn::Tag.all
    @restaurants.each do |restaurant_geo|
      restaurant = { :type => "Feature", :geometry => {:type => "Point", :coordinates => [restaurant_geo.longitude, restaurant_geo.latitude]}, :properties => { :title => restaurant_geo.name, :id => restaurant_geo.id }}
      @restaurants_geo << restaurant
    end
    @restaurants_geo_json = @restaurants_geo.to_json
    @resto = @restaurants_geo_json.html_safe  

  end

  def new
    @restaurant = Restaurant.new
    @tags = ActsAsTaggableOn::Tag.all
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
    @restaurant = Restaurant.find(params[:id])
    @honest_labels = []
    @overrated_labels = []
    @restaurant.labels.each do |label|
      if label.name == "Honnête"
        @honest_labels << label
      elsif label.name == "Surcoté"
        @overrated_labels << label      
      end
    end
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

  def preview
    @restaurant = Restaurant.find(params[:id])
    render layout: false
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :review_count, :rating, :price, :tag_list, :address, :link, :source, :image_url)
  end

end