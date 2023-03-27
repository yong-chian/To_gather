class CreateHostReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :host_reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.integer :user_rating

      t.timestamps
    end
  end
end
