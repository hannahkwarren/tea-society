# app/spec/requests/create_subscription_spec.rb

require 'rails_helper'

RSpec.describe 'Create Subscription', type: :request do
  before(:each) do
    @cust1 = Customer.create( first_name: 'Hannah',
                              last_name: 'Warner',
                              email: 'hannah@mail.com',
                              address: '123 Main St',
                              city: 'New York',
                              state: 'NY',
                              zip: '11206')

    @tea1 = Tea.create( name: 'Sun Moon Lake Hong Cha',
                        description: 'Light, naturally sweet and floral oolong tea',
                        temperature_fahrenheit: 190,
                        brew_time_mins: 4)
  end

  it 'creates a new subscription' do
    json_payload = { subscription: {
      title: 'Monthly Fix',
      price: 25.99,
      frequency: 'monthly',
      customer_id: @cust1.id,
      tea_id: @tea1.id
      }
    }

    post '/api/v1/subscriptions', params: json_payload

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:title)
    expect(parsed[:data][:attributes]).to have_key(:price)
    expect(parsed[:data][:attributes]).to have_key(:frequency)
    expect(parsed[:data][:attributes]).to have_key(:customer_id)
    expect(parsed[:data][:attributes]).to have_key(:tea_id)
  end

  it 'edge case: missing data should result in error' do
    json_payload = { subscription: {
                      title: 'Monthly Fix',
                      price: 25.99,
                      frequency: 'monthly',
                      tea_id: @tea1.id
                      # missing customer id
                      }
                    }

    post '/api/v1/subscriptions', params: json_payload

    expect(response).to have_http_status(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:error]).to eq("Couldn't find Customer without an ID")
  end

  it 'edge case: invalid data should result in error' do
    json_payload = { subscription: {
                      title: 'Monthly Fix',
                      price: 25.99,
                      frequency: 'monthly',
                      tea_id: @tea1.id,
                      customer_id: 500
                      }
                    }

    post '/api/v1/subscriptions', params: json_payload

    expect(response).to have_http_status(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:error]).to eq("Couldn't find Customer with 'id'=500")
  end
end
