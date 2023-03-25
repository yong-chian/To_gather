class AddTimeToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :start_time, :datetime, null: false
    add_column :bookings, :end_time, :datetime, null: false
    remove_column :bookings, :booking_date, :date
  end
end
