# app/models/tea.rb
class Tea < ApplicationRecord
  has_many :subscriptions
  validates :name, presence: true
end
