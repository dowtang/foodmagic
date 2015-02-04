class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    @dishes = @restaurant.dishes







    # @dish = find_by id: 

    # @size = find by 

    # @price =

  end

end