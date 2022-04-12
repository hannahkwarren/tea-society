# app/serializers/subscription_serializer.rb
class SubscriptionSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :subscription
  attributes :title
  attributes :status
  attributes :frequency
  attributes :price
  attributes :customer_id
  attributes :tea_id
end
