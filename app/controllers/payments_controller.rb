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
        amount: @product.price*100, # amount in cents, again
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )

      if charge.paid
        Order.create(product_id, user_id, amount)
        flash[:notice] = "Enjoy riding #{@product.name}"
      end

    rescue Stripe::CardError => e
      flash[:error] = "Unfortunately, there was an payment processing error: #{err[:message]}"
      redirect_to new_charge_path
    end

    redirect_to product_path(@product)

  end

end