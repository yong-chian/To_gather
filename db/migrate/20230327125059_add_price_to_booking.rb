class AddPriceToBooking < ActiveRecord::Migration[7.0]
  def change
    add_monetize :booking_payments, :price, currency: { present: false }
  end
end
