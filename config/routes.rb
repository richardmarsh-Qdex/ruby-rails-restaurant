Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'auth#login'
      post 'auth/register', to: 'auth#register'
      
      resources :restaurants
      resources :menus
      resources :menu_items
      resources :orders
      resources :reservations
    end
  end
end
