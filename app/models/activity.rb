class Activity < ApplicationRecord
  belongs_to :user
  has_one :meeting_location

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :max_capacity, presence: true
  validates :meeting_location, presence: true
  validates :name, uniqueness: true
end
