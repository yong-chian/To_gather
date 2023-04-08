class Interest < ApplicationRecord
  has_many :user_interests
  has_many :users, through: :user_interests
  has_many :activity_interests
  has_many :activities, through: :activity_interests
end
