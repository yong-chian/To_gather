class Activity < ApplicationRecord
  belongs_to :user
  has_one :meeting_location

  validates :name,
  validates :description,
  validates :price,
  validates :max_capacity,
  validates :meeting_location, presence: true
  validates :name, uniqueness: true
end
