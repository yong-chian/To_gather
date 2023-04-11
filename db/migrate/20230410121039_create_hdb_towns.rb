class CreateHdbTowns < ActiveRecord::Migration[7.0]
  def change
    create_table :hdb_towns do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps
    end
  end
end
