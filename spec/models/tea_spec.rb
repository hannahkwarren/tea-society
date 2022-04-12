# app/spec/models/tea_spec.rb

RSpec.describe Tea, type: :model do
  describe 'validations' do
    it { should validate_presence_of (:name) }
  end
end
