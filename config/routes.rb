# frozen_string_literal: true

Rails.application.routes.draw do
  scope module: :api, defaults: { format: :json }, path: '' do
    scope module: :v1 do
      root to: '/application#health_check'
      scope module: :admin do
        concern :addressable do
          resources :addresses, shallow: true
        end
        concern :transactionable do
          resources :transactions, shallow: true, except: %i[destroy]
        end
        resources :transactions, except: %i[index destroy create]
        resources :products, concerns: :transactionable
        resources :brands
        resources :product_presentations
        resources :base_measurement_units
        resources :providers, concerns: %i[addressable transactionable] do
          member do
            get :products
          end
        end
        resources :users, concerns: :addressable
        resources :customers, concerns: %i[addressable transactionable] do
          member do
            get :products
          end
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
