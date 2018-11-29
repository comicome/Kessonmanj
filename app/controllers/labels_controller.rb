class LabelsController < ApplicationController

  before_action :set_restaurant, only: [:create, :update, :destroy]

  def create
    @label = @restaurant.labels.new(label_params)
    @label.user_id = current_user.id
    if @label.save
      redirect_to restaurant_path(@restaurant)
    else
      @errors = @label.errors.full_messages
      render 'restaurants/show'
    end
  end

  def update
     
  end

  def destroy
    @label = @restaurant.labels.find(params[:id])
    if current_user.id == @label.user_id
      @label.destroy
      redirect_to restaurant_path(@restaurant)
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def label_params
    params.require(:label).permit(:name)
  end
end