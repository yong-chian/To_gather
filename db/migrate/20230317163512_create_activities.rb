class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :max_capacity
      t.date :availability
      t.string :meeting_location
      t.integer :minimum_age
      t.string :policies
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
