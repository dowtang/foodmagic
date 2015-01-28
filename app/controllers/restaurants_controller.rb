class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reataurant = Restaurant.find(params[:id])
  end

end