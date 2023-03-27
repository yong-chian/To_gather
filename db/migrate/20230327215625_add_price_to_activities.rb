class AddPriceToActivities < ActiveRecord::Migration[7.0]
  def change
    add_monetize :activities, :price, currency: { present: false }
  end
end
