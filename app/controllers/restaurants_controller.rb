class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def new
    @restaurant = Restaurant.new
  end

  def show
    @review = Review.new
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed."
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant), notice: "Restaurant was created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
