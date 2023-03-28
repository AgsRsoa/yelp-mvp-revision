class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(params_restaurant)
    redirect_to restaurant_path(@restaurant.id)
  end

  private

  def params_restaurant()
    params.require(:restaurant).permit(:name, :address, :telephone, :category)
  end
end
