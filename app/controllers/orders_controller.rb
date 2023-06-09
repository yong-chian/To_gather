class OrdersController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @activity = Activity.find(params[:activity_id])
    order = Order.create!(booking: @booking,
                          activity: @activity,
                          activity_sku: @booking.activity.sku,
                          amount: @activity.price,
                          state: 'pending',
                          user: current_user)
    authorize order
    session = Stripe::Checkout::Session.create(
      line_items: [{
        price_data: {
          currency: 'sgd',
          unit_amount: @activity.price_cents * order.booking.number_of_pax,
          product_data: {
            name: @activity.name
          }
        },
        quantity: 1
      }],
      mode: 'payment',
      success_url: order_url(order),
      cancel_url: order_url(order)
    )
    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    # success_url: order_url(order)
    @order = current_user.orders.find(params[:id])
    @booking = @order.booking
    @booking.status = "Paid & Pending Confirmation"
    @booking.save!
    authorize(@order)
  end
end
