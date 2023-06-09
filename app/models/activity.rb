class Activity < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  monetize :price_cents
  validates :name, presence: true
  validates :description, presence: true
  validates :photos, presence: true
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
  has_many :activity_interests
  has_many :interests, through: :activity_interests
  geocoded_by :meeting_location
  after_validation :geocode, if: :will_save_change_to_meeting_location?

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `mahj` will return something!
    }

  def average_rating
    participant_reviews.average(:activity_rating) || 5
  end
end
