# app/models/subscription.rb
class Subscription < ApplicationRecord
  belongs_to :tea
  belongs_to :customer
  validates :price, presence: true
  validates :frequency, presence: true
  validates :status, presence: true
  validates :customer_id, presence: true
  validates :tea_id, presence: true

  enum status: %i[inactive active]
  enum frequency: %i[weekly monthly every_other_month every_three_months]
end
