class CreateAvailabilities < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :start_time, :datetime
    remove_column :bookings, :end_time, :datetime
    remove_column :activities, :availability, :date
    create_table :availabilities do |t|
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.references :booking, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
