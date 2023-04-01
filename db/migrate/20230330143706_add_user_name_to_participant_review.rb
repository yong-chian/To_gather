class AddUserNameToParticipantReview < ActiveRecord::Migration[7.0]
  def change
    add_column :participant_reviews, :user_name, :string, null: false
    add_reference :participant_reviews, :activity, index: true
  end
end
