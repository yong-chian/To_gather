class RemoveBookingsReferencesToAvailability < ActiveRecord::Migration[7.0]
  def change
    remove_reference :availabilities, :booking, index: true
    remove_reference :bookings, :activity, index: true
    add_reference :bookings, :availability, index: true
  end
end
