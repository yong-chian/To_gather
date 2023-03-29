class CreateParticipantReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :participant_reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.text :content
      t.integer :activity_rating

      t.timestamps
    end
  end
end
