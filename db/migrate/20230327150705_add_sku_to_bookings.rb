class AddSkuToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :sku, :string
  end
end
