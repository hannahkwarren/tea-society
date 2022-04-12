# app/config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/subscriptions', to: 'subscriptions#create'
      patch '/subscriptions', to: 'subscriptions#edit'
    end
  end
end
