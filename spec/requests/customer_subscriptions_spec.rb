# spec/requests/customer_subscriptions_spec.rb
require 'rails_helper'

RSpec.describe "Customer's subscriptions", type: :request do
  before(:each) do
    @cust1 = Customer.create(first_name: 'Hannah',
                            last_name: 'Warner',
                            email: 'hannah@mail.com',
                            address: '123 Main St',
                            city: 'New York',
                            state: 'NY',
                            zip: '11206')

    @tea1 = Tea.create(  name: 'Sun Moon Lake Hong Cha',
                        description: 'Light, naturally sweet and floral oolong tea',
                        temperature_fahrenheit: 190,
                        brew_time_mins: 4)

    @tea2 = Tea.create(  name: 'Antioxidant Green',
                        description: 'Grassy and spinach green',
                        temperature_fahrenheit: 180,
                        brew_time_mins: 3)

    Subscription.create(title: 'Monthly Fix',
                        price: 25.99,
                        frequency: 'monthly',
                        customer_id: @cust1.id,
                        tea_id: @tea1.id)

    Subscription.create(title: 'Occasional Mellow',
                        price: 29.99,
                        frequency: 'every_three_months',
                        customer_id: @cust1.id,
                        tea_id: @tea2.id)
  end

  it "happy path: provides a list of a customer's subscriptions" do
    get "/api/v1/customer/#{@cust1.id}/subscriptions"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data].length).to eq(2)
    expect(parsed[:data][0][:attributes]).to have_key(:title)
    expect(parsed[:data][0][:attributes]).to have_key(:status)
    expect(parsed[:data][0][:attributes]).to have_key(:frequency)
    expect(parsed[:data][0][:attributes]).to have_key(:price)
    expect(parsed[:data][0][:attributes]).to have_key(:customer_id)
    expect(parsed[:data][0][:attributes]).to have_key(:tea_id)
  end

  it 'sad path: returns error when customer not found' do
    get "/api/v1/customer/#{1002}/subscriptions"

    expect(response).to have_http_status(400)
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed[:data][:error]).to eq("Couldn't find Customer with 'id'=1002")
  end
end
