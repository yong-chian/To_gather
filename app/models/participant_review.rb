class ParticipantReview < ApplicationRecord
  belongs_to :booking
  belongs_to :activity
  has_many_attached :photos

  validates :content, presence: true
  validates :user_name, presence: true
  validates :activity_rating, presence: true, numericality: {
    only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
