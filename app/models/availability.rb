class Availability < ApplicationRecord
  belongs_to :activity
  has_many :bookings
end
