# app/spec/models/tea_spec.rb
require 'rails_helper'
require 'pry'
RSpec.describe Tea, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :subscriptions }
  end
end
