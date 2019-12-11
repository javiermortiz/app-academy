Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :artworks, only: [:index]
    member do
      get 'favorites'
    end
  end
  
  resources :artworks
# /artworks/:id/favorite
# /users/:id/artworks/favorite
  resources :artwork_shares

  resources :comments, only: [:create, :destroy, :index]
end
