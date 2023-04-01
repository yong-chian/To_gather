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
  has_many :availabilities, dependent: :destroy
  has_many :bookings, through: :availabilities, dependent: :destroy
  attribute :availabilities_start_time
  acts_as_favoritable
  has_many :faqs
  has_many :bookings, dependent: :destroy
  has_many :participant_reviews, through: :bookings

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `mahj` will return something!
    }
end
