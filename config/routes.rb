Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :artworks
  resources :artwork_shares

  get '/users/:user_id/artworks', to: 'artworks#index'

end
