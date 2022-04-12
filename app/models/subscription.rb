# app/models/subscription.rb
class Subscription < ApplicationRecord
  belongs_to :tea

  enum status: {
    inactive: 0,
    active: 2
  }
  
  enum frequency: {
    weekly: 0,
    monthly: 1,
    every_other_month: 2,
    every_three_months: 3
  }
end
