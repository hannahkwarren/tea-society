# app/controllers/api/v1/customer_subscriptions_controller.rb
class Api::V1::CustomerSubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  def show
    customer = Customer.find(params[:id])
    subscriptions = customer.subscriptions

    if subscriptions.present?
      render json: SubscriptionSerializer.new(subscriptions)
    else
      render json: subscriptions.errors.details, status: 400
    end
  end

  private

  def handle_error(error)
    render json: { error: error.to_s }, status: :bad_request
  end
end
