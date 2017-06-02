if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_TwUTjFTZFArzA5EPS1q14xLA',
    secret_key: 'ssk_test_kjJOAy4BtVtxcjeDSutb3sh1'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# # Set your secret key: remember to change this to your live secret key in production
# # See your keys here: https://dashboard.stripe.com/account/apikeys
# Stripe.api_key = "sk_test_kjJOAy4BtVtxcjeDSutb3sh1"

# # Token is created using Stripe.js or Checkout!
# # Get the payment token submitted by the form:
# token = params[:stripeToken]

# # Charge the user's card:
# charge = Stripe::Charge.create(
#   :amount => 1000,
#   :currency => "eur",
#   :description => "Example charge",
#   :source => token,
# )