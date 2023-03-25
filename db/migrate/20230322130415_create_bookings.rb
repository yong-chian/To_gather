class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :booking_date, null: false
      t.string :user_name, null: false
      t.integer :number_of_pax, null: false
      t.text :status, null: false
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :activity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
