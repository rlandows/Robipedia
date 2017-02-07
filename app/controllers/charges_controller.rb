class ChargesController < ApplicationController
  #after_action :uprgrade_user_role, only: :create

  def create
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id,
     amount: 15_00,
     description: "Upgrade to a Premium Membership- #{current_user.email}",
     currency: 'usd'
   )

   current_user.update_attribute(:role, 'premium')

   flash[:notice] = "Thanks for your payment, #{current_user.email}! You can now create and edit private wikis."
   redirect_to root_path

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     current_user.update_attribute(:role, 'standard')
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def new
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium Membership - #{current_user.email}",
     amount: 15_00
   }
 end

 # def uprgrade_user_role
 #
 #    current_user.update_attribute(:role, 'premium')
 #    current_user.save!
 #
 # end
end
