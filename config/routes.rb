Rails.application.routes.draw do
  namespace :api do
    get '/addresses', to: 'addresses#index'
    resources :customers, only: [:index, :create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
