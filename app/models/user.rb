class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :bookings # bookings as a client
  has_many :activities
  has_many :bookings_as_host, through: :activities, source: :bookings
  has_many :orders
  acts_as_favoritor
end
