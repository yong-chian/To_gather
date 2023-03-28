class Activity < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  monetize :price_cents
  validates :name, presence: true
  validates :description, presence: true
  validates :price_cents, numericality: { greater_than_or_equal_to: 0 }
  validates :max_capacity, presence: true
  validates :meeting_location, presence: true
  validates :name, uniqueness: true
  has_many :availabilities
  has_many :bookings, through: :availabilities
  attribute :availabilities_start_time
end

