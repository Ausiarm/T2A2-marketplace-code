class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]

    def success 
        listing_id = params[:eventID]
        @listing = Listing.find(listing_id)
        @purchase = Order.find_by_listing_id(listing_id)
    end 

    def webhook 
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        @listing_id = payment.metadata.listing_id
        @user_id = payment.metadata.user_id
        receipt_url = payment.charges.data[0].receipt_url
        p "Listing id" + @listing_id
        p "user id" + @user_id
        render plain: "Success"

        new_order = Order.create!(:listing_id => @listing_id, :user_id => @user_id, :receipt_url => receipt_url, :payment_intent_id => payment_id)
        p "New Order" + new_order.to_s

        new_payment = Payment.create!(:price => :amount, :user_id => @user_id)
        p "New payment" + new_payment.to_s        
    end

end