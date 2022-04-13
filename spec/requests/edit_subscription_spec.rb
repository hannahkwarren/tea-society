# app/spec/requests/edit_subscription_spec.rb

require 'rails_helper'

RSpec.describe 'Edit Subscription', type: :request do
  it 'cancels an existing subscription' do
    cust1 = Customer.create(first_name: 'Hannah',
                    last_name: 'Warner',
                    email: 'hannah@mail.com',
                    address: '123 Main St',
                    city: 'New York',
                    state: 'NY',
                    zip: '11206')

    tea1 = Tea.create( name: 'Sun Moon Lake Hong Cha',
                description: 'Light, naturally sweet and floral oolong tea',
                temperature_fahrenheit: 190,
                brew_time_mins: 4
                      )

    subscription1 = Subscription.create(
      title: 'Monthly Fix',
      price: 25.99,
      frequency: 'monthly',
      customer_id: cust1.id,
      tea_id: tea1.id)

    json_payload = {
      "subscription": {
          "id": subscription1.id,
          "customer_id": cust1.id,
          "status": "inactive"
      }
  }

    patch '/api/v1/subscriptions', params: json_payload

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    # expect(parsed[:data]).to have_key(:attributes)
    # expect(parsed[:data][:attributes]).to have_key(:title)
    # expect(parsed[:data][:attributes]).to have_key(:price)
    # expect(parsed[:data][:attributes]).to have_key(:frequency)
    # expect(parsed[:data][:attributes]).to have_key(:customer_id)
    # expect(parsed[:data][:attributes]).to have_key(:tea_id)
  end

  it 'edge case: missing data' do

  end

end
