class PaymentsController < ApplicationController
  before_action :authenticate_user!
  require "stripe"

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :source => token,
        :amount => (@product.price * 100).to_i, # amount in cents, again
        :currency => "eur",
        :description => params[:stripeEmail]
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
      flash[:notice] = "Enjoy riding #{@product.name}"
      UserMailer.payment_received(@user, @product).deliver_now
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      redirect_to new_charge_path
    end

    redirect_to product_path(@product)
  end
end