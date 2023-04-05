class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  # has_one :host_review
  # has_one :participant_review
  belongs_to :availability
  has_many :participant_reviews, dependent: :destroy
  has_one :chatroom
end
