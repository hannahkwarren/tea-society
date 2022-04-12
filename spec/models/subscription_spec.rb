# app/spec/models/subscription_spec.rb
require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to :tea }
    it { should belong_to :customer }
  end

  describe 'validations' do
    it { should validate_presence_of :price }
    it { should validate_presence_of :frequency }
    it { should validate_presence_of :status }
    it { should validate_presence_of :customer_id }
    it { should validate_presence_of :tea_id }
  end

  describe 'enums' do
    it { should define_enum_for(:frequency).with(%w[weekly monthly every_other_month every_three_months]) }
    it { should allow_value('weekly').for(:frequency) }
    it { should allow_value('monthly').for(:frequency) }
    it { should allow_value('every_other_month').for(:frequency) }
    it { should allow_value('every_three_months').for(:frequency) }

    it { should define_enum_for(:status).with(%w[inactive active]) }
    it { should allow_value('inactive').for(:status) }
    it { should allow_value('active').for(:status) }
  end
end
