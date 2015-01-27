class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reataurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  # def create
  #   @restaurant = Restaurant.new(:code_id => params[:code_id], :restaurant_name => params[:restaurant_name], :restaurant_add => params[:restaurant_add], :restaurant_logo => params[:restaurant_logo], :restaurant_district => params[:restaurant_district], :delivery_time => params[:delivery_time], :free_delivery => params[:free_delivery], :min_delivery => params[:min_delivery], :payment_method => params[:payment_method])
    # @restaurant = Restaurant.new(product_params)

  #     if @restaurant.save
  #       redirect_to products_path
  #       else
  #       redirect_to :back
  #     end
  # end

  def edit

  end

  private
    def product_params
      params.require(:restaurant).
        permit(:code_id, :restaurant_name, :restaurant_add, :restaurant_logo, :restaurant_district, :delivery_time, :free_delivery, :min_delivery, :payment_method)
    end



end