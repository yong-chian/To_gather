class AddCompletedToBooking < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :completed, :boolean, default: false, null: false
  end
end
