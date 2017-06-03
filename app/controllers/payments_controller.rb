class PaymentsController < ApplicationController

Stripe.api_key = Rails.configuration.stripe[:secret_key]

  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
    # Create the charge on Stripe's servers - this will charge the user's card

    begin
      charge = Stripe::Charge.create(
        :amount => @product.price*100, # amount in cents, again
        :currency => "eur",
        :source => token,
        :description => params[:stripeEmail]
        # :metadata => {"@order_id" => 6735},
      )

      if charge.paid
        Order.create(
          user_id: @user.id,
          product_id: params[:product_id],
          total: @product.price
        )
        flash[:notice] = "Enjoy riding #{@product.name}"
      end

    rescue Stripe::CardError => e
      body = e.json_body
      err = body[:error]
      flash[:error] = "Unfortunately, there was an payment processing error: #{err[:message]}"
    end

    redirect_to product_path(@product)

  end

end