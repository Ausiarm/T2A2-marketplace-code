class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success   
    end 

    def webhook 
        payment_id = params[:data][:obect][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        event_id = payment.metadata.event_id
        user_id = payment.metadata.user_id
        p "Event id " + event_id
        p "user id " + user_id
        render plain: "Success"
    end

end