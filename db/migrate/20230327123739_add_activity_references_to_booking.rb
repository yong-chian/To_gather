class AddActivityReferencesToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :activity, index: true
  end
end
