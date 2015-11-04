Rails.application.routes.draw do
  root "songs#index"

  resources :songs, only: [:new, :create, :edit, :update, :destroy]
end
