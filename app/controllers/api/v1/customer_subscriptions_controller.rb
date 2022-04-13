# app/controllers/api/v1/customer_subscriptions_controller.rb
class Api::V1::CustomerSubscriptionsController < ApplicationController
  def show
    customer = Customer.find(params[:id])
    subscriptions = customer.subscriptions

    if subscriptions.present?
      render json: SubscriptionSerializer.new(subscriptions)
    else
      render json: subscriptions.errors.details, status: 400
    end
  end
end
