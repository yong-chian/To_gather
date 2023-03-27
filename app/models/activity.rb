class Activity < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :max_capacity, presence: true
  validates :meeting_location, presence: true
  validates :name, uniqueness: true
  has_many :availabilities
  has_many :bookings, through: :availabilities
  attribute :availabilities_start_time
  monetize :price_cents
end
