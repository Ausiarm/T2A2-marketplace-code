class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success   
    end 

    def webhook 
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        listing_id = payment.metadata.listing_id
        # user_id = payment.metadata.user_id
        p "Listing id " + listing_id
        # p "user id " + user_id
        render plain: "Success"
    end

end