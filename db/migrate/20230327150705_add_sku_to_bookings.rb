class AddSkuToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :sku, :string
  end
end
