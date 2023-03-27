class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  has_one :host_review
  has_one :participant_review
  belongs_to :availability
end
