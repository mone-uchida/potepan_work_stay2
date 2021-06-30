Rails.application.routes.draw do
  get '/' => "home#top"
  get 'users/login' => 'users#login_form'
  post 'users/login'=> 'users#login'
  post 'users/logout' => 'users#logout'
  get 'search' => 'rooms#search'
  get "address" => "rooms#address"
  get "/:id/reserved" => "reservations#index"
  get "/:id/record" => "rooms#record"
  post "/:id/reserve" => "rooms#reserve"

  resources :users
  resources :rooms
end
