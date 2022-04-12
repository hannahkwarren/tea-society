class Subscription < ApplicationRecord
  belongs_to :tea

  enum frequency: {
    weekly: 0,
    monthly: 1,
    every_other_month: 2,
    every_three_months: 3
  }
end
