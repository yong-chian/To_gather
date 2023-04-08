class AddBookingToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :booking, index: true
  end
end
