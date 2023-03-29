class Order < ApplicationRecord
  belongs_to :user
  belongs_to :activity
  monetize :amount_cents
end
