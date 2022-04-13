# app/controllers/api/v1/subscriptions_controller.rb
class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = subscription_params
    new_subscription = Subscription.new(subscription)

    if new_subscription.save
      render json: SubscriptionSerializer.new(new_subscription)
    else
      render json: new_subscription.errors.details, status: 400
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
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:id, :title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end
