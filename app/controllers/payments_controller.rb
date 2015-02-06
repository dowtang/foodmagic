 class PaymentsController < ApplicationController

  def new
    full_cart = params[:variations]
    # variationId = params[:variations]
    # params[:variations].all.each do |variation|
      # console.log(variation)
    # end
    @variations = Variation.where(:id => full_cart.split(","))

    # variationIds.each do |variationId|
      # variationID.
  end

  def create
    begin
      @amount = 500
      customer = Stripe::Customer.create(:email => 'example@stripe.com', :card  => params[:stripeToken])
      charge = Stripe::Charge.create(:customer    => customer.id, :amount      => @amount, :description => 'Rails Stripe customer', :currency    => 'usd')
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
  end

  def show
    # @payment = Payment.find(params[:id])  
  end

  def payment_params
    params.require(:payment).permit(:dishes, :price)
  end

end
