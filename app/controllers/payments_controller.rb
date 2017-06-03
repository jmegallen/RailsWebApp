class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i, # amount in cents, again
        currency: "eur",
        source: token,
        # description: "Berlin Bikes",
        # receipt_email: params[:stripeEmail]
        # description: params[:stripeEmail]
      )
      
      customer = Stripe::Customer.create(
      receipt_email: @user.email
      )

    if charge.paid
      Order.create(product_id: @product.id, user_id: @user.id, total: @product.price)
      flash[:notice] = "Enjoy riding #{@product.name}"
    end

    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      edirect_to new_charge_path
    end

    redirect_to product_path(@product)
  end
end