# use this is live payment
# Rails.configuration.stripe = {
#   :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
#   :secret_key      => ENV['STRIPE_SECRET_KEY']
# }

# use this in test mode but DELETE this before pushing to HEROKU
Rails.configuration.stripe = {
  :publishable_key => "pk_test_o6fDs5Zh2Et1OZhXN0AleQ3p",
  :secret_key      => "sk_test_IFdLSgtwmf7gfKS5K759Ebkg"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key] # do not change this
