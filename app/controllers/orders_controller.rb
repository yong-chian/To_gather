class OrdersController < ApplicationController
    def create
        activity = Activity.find(params[:activity_id])
        order  = Order.create!(activity: activity, activity_sku: activity.sku, amount: activity.price, state: 'pending', user: current_user)
        
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
            name: activity.sku,
            images: [activity.photo_url],
            amount: activity.price_cents,
            currency: 'sgd',
            quantity: 1
            }],
            success_url: order_url(order),
            cancel_url: order_url(order)
        )
        order.update(checkout_session_id: session.id)
        redirect_to new_order_payment_path(order)
    end
end
