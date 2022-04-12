class Customer < ApplicationRecord
  has_many :subscriptions

  enum status: {
    inactive: 0,
    active: 2
  }
end
