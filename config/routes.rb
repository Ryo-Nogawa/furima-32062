Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
<<<<<<< Updated upstream
  resources :items
=======
  resources :items do
    resources :orders, only: [:index, :create]
  end
>>>>>>> Stashed changes
end
