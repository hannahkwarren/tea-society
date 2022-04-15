# app/serializers/customer_serializer.rb
class CustomerSerializer
  include JSONAPI::Serializer
  set_id :id
  set_type :customer
  attributes :first_name
  attributes :last_name
  attributes :email
  attributes :address
  attributes :city
  attributes :state
  attributes :zip
end
