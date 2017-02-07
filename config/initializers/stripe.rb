Rails.configuration.stripe = {
   publishable_key: 'pk_test_qN41pH9iO0sWUkgsuPjK2Jt2',
   secret_key: 'sk_test_vToiKO9fhndMYhkBjBp8XEah'
 }

 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]
