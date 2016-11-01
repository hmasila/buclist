require 'api_constraints'
Rails.application.routes.draw do
  namespace :api, path: '/', format: :json do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      with_options except: [:new, :edit] do |list_only|
        list_only.resources :bucket_lists do
          list_only.resources :items
        end
      end
    end
    post 'auth/login', to: 'authentication#login'
    get 'auth/logout', to: 'authentication#logout'

    post 'signup', to: 'users#create'
  end
end
