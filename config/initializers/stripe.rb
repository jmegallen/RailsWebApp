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

require "stripe"
Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Set your secret key: remember to change this to your live secret key in production
# See your keys here: https://dashboard.stripe.com/account/apikeys

    # publishable_key: ENV['stripe_publishable_key'],
    # secret_key: ENV['stripe_secret_key']