Rails.application.routes.draw do
  namespace :api, path: "/", defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1) do
      with_options except: [:new, :edit] do |list_only|
        list_only.resources :bucketlists do
          list_only.resources :items
        end
      end
    end
  end

  post "auth/login", to: "authentication#login"
  get "auth/logout", to: "authentication#logout"

  post "signup", to: "users#create"
end
