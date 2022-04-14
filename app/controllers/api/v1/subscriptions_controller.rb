# app/controllers/api/v1/subscriptions_controller.rb
class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error

  def create
    customer = Customer.find(subscription_params[:customer_id])
    tea = Tea.find(subscription_params[:tea_id])
    subscription = subscription_params
    if customer.present? && tea.present?
      new_subscription = Subscription.new(subscription)
      if new_subscription.save
        render json: SubscriptionSerializer.new(new_subscription)
      else
        render json: new_subscription.errors.details, status: 400
      end
    else
      render json: { error: 'Invalid request.' }
    end
  end

  def edit
    customer = Customer.find(subscription_params[:customer_id])
    if customer.present?
      subscription = Subscription.find(subscription_params[:id])
      subscription.status = subscription_params[:status]
      if subscription.save
        render json: SubscriptionSerializer.new(subscription)
      else
        render json: subscription.errors.details, status: 400
      end
    else
      render json: customer.errors.details, status: 400
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:id, :title, :price, :status, :frequency, :customer_id, :tea_id)
  end

  def handle_error(error)
    render json: { error: error.to_s }, status: :bad_request
  end
end
